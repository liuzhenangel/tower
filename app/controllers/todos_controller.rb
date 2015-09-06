class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_and_team
  before_action :find_todo, only: [:edit, :update, :restore, :destroy, :open, :finish, :show]

  def index
    @todolists = @project.todolists
  end

  def show
  end

  def new
    @todolist = Todolist.find(params[:todolist_id])
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.todolist = Todolist.find(params[:todolist_id])
    @todo.save
  end

  def open
    @todo.open!
    redirect_to project_path(@project)
  end

  def finish
    @todo.finish!
    redirect_to project_path(@project)
  end

  def destroy
    @todo.destroy
    redirect_to project_path(@project)
  end

  def restore
    if @todo.restore
      @todo.create_event('恢复了任务')
    end
    redirect_to project_path(@project)
  end

  def update
    @todo.update(todo_params)
    render 'create'
  end

  private
  def find_todo
    @todo = Todo.with_deleted.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :user_id, :end_time)
  end

  def set_project_and_team
    @project = Project.find(params[:project_id])
    @team = @project.team
  end
end
