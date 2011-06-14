class Solution < ActiveRecord::Base
  belongs_to :question
  belongs_to :team
  has_and_belongs_to_many :clues

  delegate :possible_points, :to => :question

  def points_awarded
    return 0 unless solved?
    return @points_awarded if defined?(@points_awarded)
    @points_awarded = possible_points - clues.sum(:point_cost)
    @points_awarded = 0 if @points_awarded < 0
    @points_awarded
  end

  def solved?
    true
  end
end
