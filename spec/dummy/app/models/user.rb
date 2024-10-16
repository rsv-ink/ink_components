# frozen_string_literal: true

class User
  include ActiveModel::Model

  attr_accessor :name, :email, :paid

  def initialize(paid:)
    super
    @paid = paid
  end

  def persisted?
    false
  end
end
