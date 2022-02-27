module CurrentUser
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    @current_user = nil
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
end
