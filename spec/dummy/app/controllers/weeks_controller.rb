# frozen_string_literal: true

class WeeksController < ApplicationController
  def new
    @week = Week.new(name: "week 1")
    @days = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"]
  end

  def create
  end
end
