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
      redirect_to :root
    else
      render :action => "new"
    end
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

end
