class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :group_name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :group_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :group_name])

    # devise_invitable
    devise_parameter_sanitizer.permit(:invite, keys: [:username, :group_id])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:username, :group_id])
  end

end
