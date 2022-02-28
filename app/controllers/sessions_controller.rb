# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @auth = Auth.from_auth_hash(auth_hash)
    @user = @auth.user
    if @user
      redirect_to user_path(@user)
    else
      @user = @auth.create_user
      redirect_to root_path
    end
    self.current_user = @user
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
