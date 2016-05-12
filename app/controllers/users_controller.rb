class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /users - Sticky footer is less that one project on profile page
  def index
    @projects = Project.all
    @comments = Comment.all

    if @projects.joins(:category).count < 1
       @sticky_footer = true
    end
    if params[:approved] == "false"
      @users = User.find_by_approved(false)
    else
      @users = User.all
    end
  end


  # POST /users


  # PATCH/PUT /users/1

  # DELETE /users/1

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
