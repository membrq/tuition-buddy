class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    flash[:notice] = "Confirm your account to sign in!"
    unauthenticated_root_path
  end
end
