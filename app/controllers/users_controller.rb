class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /users
  def index
    @projects = Project.all
    @comments = Comment.all

    if @projects.joins(:category).count<1
       @sticky_footer = true
    end

    if params[:approved] == "false"
      @users = User.where(id: false)
    else
      @users = User.all
    end
    @current_nav_identifier = :registration

  end

  # GET /users/1
  def show
    @current_nav_identifier = :registration
    @disabled_nav = true
    @sticky_footer = true
  end

  # GET /users/1/edit
  def edit
    @current_nav_identifier = :registration
    @disabled_nav = true
    @sticky_footer = true
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to :profile, notice: 'User was successfully updated.'
    else
      render :edit
    end
    @current_nav_identifier = :registration
    @disabled_nav = true
    @sticky_footer = true
  end


  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :confirm_password,:avatar)
    end
end
