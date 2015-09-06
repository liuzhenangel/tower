class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team

  def index
    #当前team下的所有events
    @events = Event.where(team_id: @team.id).page(params[:page])
  end

  private
  def set_team
    @team = Team.find(params[:team_id])
  end
end
