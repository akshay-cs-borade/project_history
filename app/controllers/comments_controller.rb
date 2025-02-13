class CommentsController < ApplicationController
  before_action :find_project

  def create
    @comment = @project.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      notify_users(@project, "#{current_user.name} commented: #{@comment.content}")
      render json: @comment, status: :created
    else
      render json: { error: "Comment not saved" }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.can_delete_comments?
      @comment.destroy
      render json: { message: "Comment deleted" }, status: :ok
    else
      render json: { error: "Permission denied" }, status: :forbidden
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
