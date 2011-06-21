class HomeController < ApplicationController
  before_filter :authenticate_team_member!, :only => :purchase_clue
  def index
  end

  def purchase_clue
    clue = Clue.find(params[:clue_id])
    if current_team_member.purchase(clue)
      flash[:notice] = "Clue purchased: #{clue.text}"
      respond_to do |format|
        format.html { redirect_to home_path }
        format.js { clue.to_json }
      end
    end
  end
end