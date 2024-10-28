# frozen_string_literal: true

class Admin::Group
  include ActiveModel::Model

  attr_accessor :users

  def initialize(users = [])
    @users = users
  end
end
