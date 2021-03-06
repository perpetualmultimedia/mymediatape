class Users::RegistrationsController < Devise::RegistrationsController
	  before_filter :update_sanitized_params, if: :devise_controller?
  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :avatar, :state, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :avatar, :state, :email, :password, :password_confirmation, :current_password)}

  end
   def after_sign_up_path_for(resource)
    '/static_pages/sign_up_success'
  end

end 