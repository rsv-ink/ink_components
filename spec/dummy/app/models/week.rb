# frozen_string_literal: true

class Week
  include ActiveModel::Model

  attr_accessor :name

  def initialize(**kwargs)
    super
    @name = kwargs.fetch("name", "")
  end
end
