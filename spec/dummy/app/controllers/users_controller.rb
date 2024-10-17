# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new(name: "", email: "", paid: true)
  end

  def create
    @user = User.new(**user_params)
    @user.valid?
    render :new, flash: { notice: "Usuário criado com sucesso!" }
  end

  private

  def user_params
    return {} unless params.key?(:user)

    params.require(:user).permit(:name, :email, :paid)
  end
end
