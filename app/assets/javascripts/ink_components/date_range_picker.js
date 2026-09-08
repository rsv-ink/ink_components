// Served through the Rails asset pipeline, the same way turbo-rails and stimulus-rails ship theirs.
// Classic script wrapped in an IIFE: nothing is exported, the component wires itself up on load.
;(function () {
"use strict"

const SELECTOR = "[data-date-range-picker]"
const CHANGE_EVENT = "ink:date-range-picker:change"

const CHEVRONS = {
  left: "m14 8-4 4 4 4",
  right: "m10 16 4-4-4-4",
  down: "m8 10 4 4 4-4"
}

const el = (tag, className = "") => {
  const node = document.createElement(tag)
  if (className) node.className = className
  return node
}

const chevron = (direction, size = 20) =>
  `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 24 24" fill="none" aria-hidden="true"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="${CHEVRONS[direction]}"/></svg>`

const parse = (value) => {
  const [year, month, day] = value.split("-").map(Number)
  return new Date(year, month - 1, day)
}

const pad = (value) => String(value).padStart(2, "0")
const iso = (date) => `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}`
const key = (date) => (date ? date.getFullYear() * 10000 + date.getMonth() * 100 + date.getDate() : 0)
const firstOfMonth = (date) => new Date(date.getFullYear(), date.getMonth(), 1)
const addMonths = (date, amount) => new Date(date.getFullYear(), date.getMonth() + amount, 1)
const monthDiff = (from, to) => (to.getFullYear() - from.getFullYear()) * 12 + (to.getMonth() - from.getMonth())

const format = (date, pattern) => {
  if (!date) return "—"

  return pattern
    .replace("%d", pad(date.getDate()))
    .replace("%m", pad(date.getMonth() + 1))
    .replace("%Y", date.getFullYear())
    .replace("%y", pad(date.getFullYear() % 100))
}

class DateRangePicker {
  constructor(element) {
    this.element = element
    this.config = JSON.parse(element.dataset.dateRangePickerConfig)
    this.classes = this.config.classes
    this.labels = this.config.labels
    this.months = Math.min(2, Math.max(1, this.config.months || 2))
    this.presets = new Map(this.config.presets.map((preset) => [preset.id, preset]))

    this.start = parse(this.config.start)
    this.end = parse(this.config.end)
    this.preset = this.config.preset
    this.applied = { start: this.start, end: this.end, preset: this.preset }
    this.hover = null
    this.picker = null
    this.anchors = this.anchorsFor(this.start, this.end)
    this.pickerYear = this.start.getFullYear()

    this.onOutsidePointer = (event) => {
      if (!this.element.contains(event.target)) this.close()
    }
    this.onKeydown = (event) => {
      if (event.key === "Escape") this.close()
    }

    this.bind()
    this.render()
  }

  target(name) {
    return this.element.querySelector(`[data-date-range-picker-target="${name}"]`)
  }

  targets(name) {
    return Array.from(this.element.querySelectorAll(`[data-date-range-picker-target="${name}"]`))
  }

  bind() {
    this.target("trigger").addEventListener("click", () => this.toggle())
    this.target("cancel").addEventListener("click", () => this.cancel())
    this.target("apply").addEventListener("click", () => this.apply())

    this.targets("preset").forEach((button) => {
      button.addEventListener("click", () => this.selectPreset(button.dataset.presetId))
    })
  }

  toggle() {
    this.target("panel").classList.contains("hidden") ? this.open() : this.close()
  }

  open() {
    this.target("panel").classList.replace("hidden", "flex")
    this.target("trigger").setAttribute("aria-expanded", "true")
    document.addEventListener("pointerdown", this.onOutsidePointer)
    document.addEventListener("keydown", this.onKeydown)
    this.render()
  }

  close() {
    this.target("panel").classList.replace("flex", "hidden")
    this.target("trigger").setAttribute("aria-expanded", "false")
    document.removeEventListener("pointerdown", this.onOutsidePointer)
    document.removeEventListener("keydown", this.onKeydown)
  }

  destroy() {
    document.removeEventListener("pointerdown", this.onOutsidePointer)
    document.removeEventListener("keydown", this.onKeydown)
  }

  selectPreset(id) {
    const preset = this.presets.get(id)

    if (!preset) {
      this.preset = id
      return this.render()
    }

    this.start = parse(preset.start)
    this.end = parse(preset.end)
    this.preset = id
    this.hover = null
    this.picker = null
    this.anchors = this.anchorsFor(this.start, this.end)
    this.render()
  }

  cancel() {
    this.start = this.applied.start
    this.end = this.applied.end
    this.preset = this.applied.preset
    this.hover = null
    this.picker = null
    this.anchors = this.anchorsFor(this.start, this.end)
    this.render()
    this.close()
  }

  apply() {
    if (!this.end) this.end = this.start

    this.applied = { start: this.start, end: this.end, preset: this.preset }

    const detail = { start: iso(this.start), end: iso(this.end), preset: this.preset }

    this.target("start-field").value = detail.start
    this.target("end-field").value = detail.end
    this.target("preset-field").value = detail.preset

    const presetNode = this.target("trigger-preset")
    const rangeNode = this.target("trigger-range")

    if (presetNode) presetNode.textContent = `${this.presetLabel(this.applied.preset)}${this.labels.presetSuffix}`
    if (rangeNode) rangeNode.textContent = `${format(this.applied.start, this.config.dateFormat)} - ${format(this.applied.end, this.config.dateFormat)}`

    this.close()
    this.element.dispatchEvent(new CustomEvent(CHANGE_EVENT, { detail, bubbles: true }))

    if (this.config.submitOnApply) this.target("form").requestSubmit()
  }

  anchorsFor(start, end) {
    const first = firstOfMonth(start)
    if (this.months === 1) return [first]

    const last = firstOfMonth(end || start)
    return [first, monthDiff(first, last) >= 1 ? last : addMonths(first, 1)]
  }

  canAnchor(index, date) {
    if (this.months === 1) return true

    const other = this.anchors[index === 0 ? 1 : 0]

    return (index === 0 ? monthDiff(date, other) : monthDiff(other, date)) >= 1
  }

  setAnchor(index, date) {
    if (!this.canAnchor(index, date)) return false

    this.anchors[index] = date
    return true
  }

  clickDay(date) {
    if (!this.start || this.end) {
      this.start = date
      this.end = null
    } else if (date < this.start) {
      this.end = this.start
      this.start = date
    } else {
      this.end = date
    }

    this.hover = null
    this.preset = "custom"
    this.renderPresets()
    this.renderRangeLabel()
    this.paintDays()
  }

  presetLabel(id) {
    const button = this.targets("preset").find((candidate) => candidate.dataset.presetId === id)
    if (!button) return this.labels.custom

    return button.querySelector('[data-date-range-picker-target="preset-label"]').textContent.trim()
  }

  render() {
    this.renderPresets()
    this.renderRangeLabel()

    this.dayCells = []

    const panes = Array.from({ length: this.months }, (_, index) => this.pane(index))
    if (this.months > 1) panes.splice(1, 0, this.gapMarker())

    this.target("calendar").replaceChildren(...panes)
    this.paintDays()
  }

  // Rebuilding the grid under the cursor re-fires mouseenter in a loop.
  paintDays() {
    const from = key(this.start)
    const to = key(this.end || this.hover || this.start)
    const lo = Math.min(from, to)
    const hi = Math.max(from, to)
    const today = key(new Date())

    this.dayCells.forEach(({ button, date }) => {
      const stamp = key(date)
      const isStart = stamp === lo
      const isEnd = stamp === hi
      const inRange = stamp > lo && stamp < hi
      const weekday = date.getDay()

      let className = `${this.classes.day} ${this.classes.dayHover}`
      let radius = "8px"

      if (inRange) {
        className = `${this.classes.day} ${this.classes.dayInRange}`
        radius = "0"
        if (weekday === 0) radius = "8px 0 0 8px"
        if (weekday === 6) radius = "0 8px 8px 0"
      }

      if (isStart || isEnd) {
        className = `${this.classes.day} ${this.classes.daySelected}`
        if (lo !== hi) radius = isStart ? "8px 0 0 8px" : "0 8px 8px 0"
      }

      if (stamp === today && !isStart && !isEnd) {
        className = `${className} ${this.classes.dayToday}`
      }

      button.className = className
      button.style.borderRadius = radius

      if (isStart || isEnd) button.setAttribute("aria-selected", "true")
      else button.removeAttribute("aria-selected")
    })
  }

  renderRangeLabel() {
    this.target("range-label").textContent =
      `${format(this.start, this.config.dateFormat)} — ${format(this.end || this.start, this.config.dateFormat)}`
  }

  renderPresets() {
    this.targets("preset").forEach((button) => {
      const selected = button.dataset.presetId === this.preset
      const label = button.querySelector('[data-date-range-picker-target="preset-label"]')
      const dot = button.querySelector('[data-date-range-picker-target="preset-dot"]')
      const hint = button.querySelector('[data-date-range-picker-target="preset-hint"]')

      button.setAttribute("aria-pressed", String(selected))
      button.className = selected ? this.classes.presetRowSelected : this.classes.presetRow
      label.className = selected ? this.classes.presetLabelSelected : this.classes.presetLabel
      dot.className = selected ? this.classes.presetDotSelected : this.classes.presetDot

      if (hint) hint.classList.toggle("hidden", !selected || hint.textContent.trim() === "")
    })
  }

  pane(index) {
    const base = this.anchors[index]
    const pane = el("div", this.classes.pane)
    const header = el("div", this.classes.paneHeader)

    const step = (amount) => () => {
      if (!this.setAnchor(index, addMonths(this.anchors[index], amount))) return

      this.picker = null
      this.render()
    }

    header.append(
      this.navButton("left", step(-1), this.canAnchor(index, addMonths(base, -1))),
      this.titleButton(base, index),
      this.navButton("right", step(1), this.canAnchor(index, addMonths(base, 1)))
    )

    pane.append(header, this.picker === index ? this.monthPicker(index, base) : this.days(base))
    return pane
  }

  // `display: none` would collapse the gap and resize the panel on every navigation.
  gapMarker() {
    const marker = el("span", this.classes.gap)
    marker.textContent = "…"
    marker.setAttribute("aria-hidden", "true")
    marker.classList.toggle(this.classes.gapHidden, monthDiff(this.anchors[0], this.anchors[1]) <= 1)
    return marker
  }

  navButton(direction, onClick, enabled = true) {
    const button = el("button", this.classes.navButton)
    button.type = "button"
    button.disabled = !enabled
    button.innerHTML = chevron(direction)
    button.addEventListener("click", onClick)
    return button
  }

  titleButton(base, index) {
    const active = this.picker === index
    const button = el("button", `${this.classes.title} ${active ? this.classes.titleActive : ""}`.trim())
    button.type = "button"
    button.setAttribute("aria-expanded", String(active))
    button.innerHTML = `${this.labels.months[base.getMonth()]} ${base.getFullYear()}${chevron("down", 15)}`
    button.addEventListener("click", () => {
      this.picker = active ? null : index
      this.pickerYear = base.getFullYear()
      this.render()
    })
    return button
  }

  monthPicker(index, base) {
    const wrapper = el("div", "flex flex-col gap-2.5")
    const header = el("div", "flex items-center justify-between")
    const year = el("span", this.classes.year)
    year.textContent = this.pickerYear

    header.append(
      this.navButton("left", () => {
        this.pickerYear -= 1
        this.render()
      }),
      year,
      this.navButton("right", () => {
        this.pickerYear += 1
        this.render()
      })
    )

    const grid = el("div", this.classes.monthGrid)

    this.labels.monthsAbbr.forEach((label, month) => {
      const current = this.pickerYear === base.getFullYear() && month === base.getMonth()
      const button = el("button", current ? `${this.classes.monthButton} ${this.classes.monthCurrent}` : this.classes.monthButton)
      button.type = "button"
      button.textContent = label
      button.addEventListener("click", () => {
        this.setAnchor(index, new Date(this.pickerYear, month, 1))
        this.picker = null
        this.render()
      })
      grid.append(button)
    })

    wrapper.append(header, grid)
    return wrapper
  }

  days(base) {
    const wrapper = el("div", "flex flex-col gap-1")
    const header = el("div", this.classes.weekdayRow)

    this.labels.weekdays.forEach((weekday) => {
      const cell = el("span", this.classes.weekday)
      cell.textContent = weekday
      header.append(cell)
    })

    const grid = el("div", this.classes.dayGrid)
    grid.addEventListener("mouseleave", () => {
      if (this.hover) {
        this.hover = null
        this.paintDays()
      }
    })

    const year = base.getFullYear()
    const month = base.getMonth()
    const lead = new Date(year, month, 1).getDay()
    const total = new Date(year, month + 1, 0).getDate()

    for (let i = 0; i < lead; i += 1) grid.append(el("span", "h-[34px]"))

    for (let day = 1; day <= total; day += 1) {
      const date = new Date(year, month, day)
      const button = el("button", this.classes.day)
      button.type = "button"
      button.textContent = day
      button.setAttribute("aria-label", format(date, this.config.dateFormat))
      button.addEventListener("click", () => this.clickDay(date))
      button.addEventListener("mouseenter", () => {
        if (this.start && !this.end) {
          this.hover = date
          this.paintDays()
        }
      })

      this.dayCells.push({ button, date })
      grid.append(button)
    }

    wrapper.append(header, grid)
    return wrapper
  }
}

function initDateRangePickers(root = document) {
  root.querySelectorAll(SELECTOR).forEach((element) => {
    if (element.dataset.dateRangePickerReady) return

    element.dataset.dateRangePickerReady = "true"
    new DateRangePicker(element)
  })
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", () => initDateRangePickers())
} else {
  initDateRangePickers()
}

document.addEventListener("turbo:load", () => initDateRangePickers())
document.addEventListener("turbo:frame-load", (event) => initDateRangePickers(event.target))
})()
