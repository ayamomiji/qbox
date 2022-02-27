class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    @auth = Auth.from_auth_hash(auth_hash)
    @auth.create_user unless @auth.user
    self.current_user = @auth.user
    redirect_to root_path
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
