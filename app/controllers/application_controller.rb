class ApplicationController < ActionController::Base
#  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

#  include Pundit

#  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def require_sign_in #what would this need to redirect from?
    unless current_user
      flash[:alert] = "You must be logged in to do that!"
      redirect_to new_user_path
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def authorize_admin
    return unless !current_user.is_admin?
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password])
  end
end
