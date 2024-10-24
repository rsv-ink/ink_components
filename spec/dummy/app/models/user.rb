# frozen_string_literal: true

class User
  include ActiveModel::Model

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :age, numericality: { greater_than: 18, message: "must be greater than 18" }

  attr_accessor :name, :email, :paid, :type, :color, :age, :password, :telephone, :url, :number, :date, :datetime, :datetime_local, :month, :week, :time, :color, :search, :range

  def initialize(**kwargs)
    super
    @paid = kwargs.fetch("paid", false)
    @name = kwargs.fetch("name", "")
    @email = kwargs.fetch("email", "")
    @type = kwargs.fetch("type", "")
    @color = kwargs.fetch("color", "")
    @age = kwargs.fetch("age", 1)
  end

  def persisted?
    false
  end
end
