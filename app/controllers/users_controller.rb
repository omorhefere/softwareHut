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
    @current_nav_identifier = :profile

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
