# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
	  before_filter :update_sanitized_params, if: :devise_controller?
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :zip_code, :email, :password, :password_confirmation)}
  end
  def new
    super
  end

  def create
    # add custom create logic here
  end

  def update
    super
  end
end 