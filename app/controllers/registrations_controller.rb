class RegistrationsController < Devise::RegistrationsController
  #Devise handles registration, registration controller only for sanitizing
   before_filter :configure_permitted_parameters


  protected

  #Sanitizing(White listing) parameters
  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation,:avatar) }
      devise_parameter_sanitizer.for(:accept_invitation) { |u| u.permit(:name, :password, :password_confirmation,:invitation_token,:work) }
      devise_parameter_sanitizer.for(:account_update) { |u|  u.permit(:name,:email, :password, :password_confirmation, :current_password,:avatar) }
  end

  def after_sign_up_path_for(resource)
    :new_user_session # Or :prefix_to_your_route
  end

end
