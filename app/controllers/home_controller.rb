class HomeController < ApplicationController
  def index
    @current_team = Team.first
  end
end