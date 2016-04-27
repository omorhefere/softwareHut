class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /projects
  def index
    @projects = Project.all
    if @projects.joins(:category).count<3
       @sticky_footer = true
    end
    @current_nav_identifier = :home
  end

  # GET /projects/1
  def show
  end

  def search
    @projects = Project.all
    if params[:search]
      @projectsSearch = Project.search(params[:search]).order("created_at DESC")
    end
    if @projectsSearch.count<3
       @sticky_footer = true
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    @current_nav_identifier = :add_new_project
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  def remove_image1
    @project = Project.find(params[:id])
    @project.image1 = nil
    @project.save
    redirect_to @project, flash: { success: 'Image has been removed.' }
  end

  def remove_image2
    @project = Project.find(params[:id])
    @project.image2 = nil
    @project.save
    redirect_to @project, flash: { success: 'Image has been removed.' }
  end

  def remove_image3
    @project = Project.find(params[:id])
    @project.image3 = nil
    @project.save
    redirect_to @project, flash: { success: 'Image has been removed.' }
  end

  def remove_image4
    @project = Project.find(params[:id])
    @project.image4 = nil
    @project.save
    redirect_to @project, flash: { success: 'Image has been removed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:project_number, :priority_duration, :project_title, :aims, :why_important, :would_do_project, :funding, :time_scale, :benefits, :methodology, :stage, :volunteers, :category_id, :subcategory_id, :project_description, :user_id, :image1, :image2, :image3, :image4 )
    end
end
