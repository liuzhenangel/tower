class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, except: :show

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.team = @team

    if @project.save
      redirect_to project_path(id: @project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @team = @project.team
    @todo = Todo.new
    @todolist = @project.todolists.find_by!(name: '')
  end

  def index
    @projects = @team.projects
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :project_type)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
