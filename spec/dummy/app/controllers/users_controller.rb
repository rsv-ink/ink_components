# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    render :new, flash: { notice: "Usuário criado com sucesso!" }
  end
end
