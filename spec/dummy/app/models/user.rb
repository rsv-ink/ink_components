# frozen_string_literal: true

class User
  include ActiveModel::Model

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  attr_accessor :name, :email, :paid, :type, :color

  def initialize(**kwargs)
    super
    @paid = kwargs.fetch("paid", false)
    @name = kwargs.fetch("name", "")
    @email = kwargs.fetch("email", "")
    @type = kwargs.fetch("type", "")
    @color = kwargs.fetch("color", "")
  end

  def persisted?
    false
  end

  def new_record?
    true
  end
end
