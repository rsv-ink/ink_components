# frozen_string_literal: true

module InkComponents
  module DateRangePicker
    module Types
      class Preview < Lookbook::Preview
        CAMPAIGNS = InkComponents::DateRangePicker::Preview::CAMPAIGNS

        # Layout padrão: coluna de presets à esquerda e dois meses navegáveis.
        def with_presets
          date_range_picker_component(id: "with-presets-date-range-picker", submit_on_apply: false)
        end

        # Só o calendário, sem a coluna de presets.
        def without_presets
          date_range_picker_component(id: "without-presets-date-range-picker", show_presets: false, submit_on_apply: false)
        end

        # Um único mês, para espaços estreitos.
        def single_month
          date_range_picker_component(id: "single-month-date-range-picker", months: 1, submit_on_apply: false)
        end

        # ## Campanhas
        #
        # O grupo **CAMPANHAS** da coluna de presets não é fixo: ele vem de dados. Datas
        # comemorativas mudam de ano para ano e de loja para loja, então o component recebe
        # a lista pronta em vez de embutir os períodos no código. Sem `campaigns:`, o grupo
        # nem é renderizado.
        #
        # `campaigns:` aceita um array de hashes ou de objetos que respondam a:
        #
        # | chave | papel |
        # |---|---|
        # | `id` | identificador da campanha |
        # | `label` (ou `name`) | rótulo exibido na lista |
        # | `starts_on` | primeiro dia do período |
        # | `ends_on` | último dia do período |
        #
        # ```ruby
        # CAMPAIGNS = [
        #   { id: "fathers-day-2025", label: "Dia dos Pais 2025", starts_on: Date.new(2025, 8, 4), ends_on: Date.new(2025, 8, 10) },
        #   { id: "christmas-2025", label: "Natal 2025", starts_on: Date.new(2025, 12, 1), ends_on: Date.new(2025, 12, 25) }
        # ].freeze
        #
        # date_range_picker_component(id: "periodo", campaigns: CAMPAIGNS)
        # ```
        #
        # Cada campanha vira um preset com id `campaign:<id>` — aqui,
        # `campaign:fathers-day-2025` e `campaign:christmas-2025`. Esse é o valor que sai no
        # campo oculto `preset` ao aplicar e o mesmo que você devolve em `preset:` para
        # reabrir o picker já naquele período.
        #
        # O rótulo mais longo da lista define a largura do gatilho, campanhas incluídas — e
        # essa largura fica fixa para todos os presets, então trocar de período não faz o
        # botão pular de tamanho.
        #
        # Guia completo, com o uso no app: página **Date Range Picker › Campanhas**.
        def campaigns
          date_range_picker_component(id: "campaigns-date-range-picker", campaigns: CAMPAIGNS, submit_on_apply: false)
        end

        # Gatilho só com o rótulo do preset.
        def label_only
          date_range_picker_component(id: "label-only-date-range-picker", type: :label, campaigns: CAMPAIGNS, submit_on_apply: false)
        end

        # Gatilho só com o período.
        def range_only
          date_range_picker_component(id: "range-only-date-range-picker", type: :range, campaigns: CAMPAIGNS, submit_on_apply: false)
        end
      end
    end
  end
end
