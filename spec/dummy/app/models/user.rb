# frozen_string_literal: true

class User
  include ActiveModel::Model

  validates :name, presence: true

  attr_accessor :name, :email, :paid

  def initialize(**kwargs)
    super
    @paid = kwargs.fetch("paid", false)
    @name = kwargs.fetch("name", "")
    @email = kwargs.fetch("email", "")
  end

  def persisted?
    false
  end
end
