class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_and_project_and_team

  def show
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    @team.save
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
