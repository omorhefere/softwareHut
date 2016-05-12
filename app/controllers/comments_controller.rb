class CommentsController < ApplicationController

  authorize_resource
  #Create a comment
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)
    redirect_to project_path(@project)
  end

  #Delete a comment
  def destroy
    @project = Project.find params[:project_id]
    @comment = @project.comments.find params[:id]
    @comment.destroy
    redirect_to project_path(@project)
  end

  #Comment parameters
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
