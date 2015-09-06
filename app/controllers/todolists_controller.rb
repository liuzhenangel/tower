class TodolistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_and_team

  def show
    @todolist = Todolist.find(params[:id])
  end

  private
  def set_project_and_team
    @project = Project.find(params[:project_id])
    @team = @project.team
  end
end
