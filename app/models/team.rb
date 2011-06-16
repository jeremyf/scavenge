class Team < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
  has_many :questions, :through => :solutions
  has_and_belongs_to_many :users

  class Score
    attr_reader :current, :possible, :clues_purchased
    def initialize(team)
      @team = team
      @current = 0
      @possible = 0
      @clues_purchased = 0
      @team.solutions.each do |solution|
        @current += solution.points_awarded
        @possible += solution.possible_points_still_available
        @clues_purchased += solution.points_spent_on_clues
      end
    end
  end

  def score
    @score ||= Score.new(self)
  end
end
