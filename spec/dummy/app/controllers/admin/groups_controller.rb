class Admin::GroupsController < ApplicationController
  def new
    @group = Admin::Group.new([
      User.new(name: "Alice", email: "alice@example.com"),
      User.new(name: "Bob", email: "bob@example.com"),
      User.new(name: "Dani", email: "dani@example.com")
    ])
  end
end
