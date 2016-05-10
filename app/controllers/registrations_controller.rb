class RegistrationsController < Devise::RegistrationsController
   before_filter :configure_permitted_parameters

  def new
    @user= User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @user.valid?
    if @user.errors.blank?
      @user.save
      welcome_email(user)
      redirect_to :new_user_session
    else
      render :action => "new"
    end
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation,:avatar) }
      devise_parameter_sanitizer.for(:accept_invitation) { |u| u.permit(:name, :password, :password_confirmation,:invitation_token,:work) }
      devise_parameter_sanitizer.for(:account_update) { |u|  u.permit(:name,:email, :password, :password_confirmation, :current_password,:avatar) }
  end

  def after_sign_up_path_for(resource)
    :new_user_session # Or :prefix_to_your_route
  end

end
