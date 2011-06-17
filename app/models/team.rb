class Team < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy, :include => :question
  has_many :questions, :through => :solutions
  has_many :team_members

  def self.leaderboard
    all.sort {|a,b| a.score <=> b.score }
  end

  def to_s
    name
  end

  def score
    @score ||= Score.new(self.solutions)
  end
end
