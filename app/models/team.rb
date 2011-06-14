class Team < ActiveRecord::Base
  has_many :solutions, :dependent => :destroy
  has_many :questions, :through => :solutions

  def current_score
    solutions.collect(&:points_awarded)
  end
end
