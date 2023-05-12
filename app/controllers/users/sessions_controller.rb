class Users::SessionsController < Devise::SessionsController
  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
