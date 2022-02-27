class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @auth = Auth.from_auth_hash(auth_hash)

    render json: @auth
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
