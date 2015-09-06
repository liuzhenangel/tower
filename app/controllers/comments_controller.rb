class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_and_project_and_team

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.todo = @todo
    @comment.save
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_todo_and_project_and_team
    @todo = Todo.find(params[:todo_id])
    @project = Project.find(params[:project_id])
    @team = @project.team
  end
end
