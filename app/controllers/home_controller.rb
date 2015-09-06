class HomeController < ApplicationController
  layout 'home'
  before_action :authenticate_user!

  def index
    @teams = current_user.teams
  end
end
