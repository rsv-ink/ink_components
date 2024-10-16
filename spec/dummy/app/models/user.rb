# frozen_string_literal: true

class User
  include ActiveModel::Model

  attr_accessor :name, :email

  def persisted?
    false
  end
end
