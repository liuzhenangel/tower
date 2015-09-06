class HomeController < ApplicationController
  layout false
  before_action :authenticate_user!

  def index
    @teams = current_user.teams
  end
end
