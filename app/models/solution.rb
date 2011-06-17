class Solution < ActiveRecord::Base
  belongs_to :question
  belongs_to :team
  has_and_belongs_to_many :clues

  delegate :possible_points, :to => :question

  def possible_points_still_available
    possible_points - points_spent_on_clues
  end

  def points_spent_on_clues
    clues.sum(:point_cost)
  end

  def to_s
    question.to_s
  end

  def score
    @score ||= Score.new([self])
  end

  def points_awarded
    return 0 unless solved?
    return @points_awarded if defined?(@points_awarded)
    @points_awarded = possible_points - points_spent_on_clues
    @points_awarded = 0 if @points_awarded < 0
    @points_awarded
  end

  state_machine :state, :initial => :open do
    event :solve do
      transition :open => :pending
    end

    event :confirm do
      transition :pending => :confirmed
    end

    state :open do
      def solved?; false; end
    end
    state :pending do
      def solved?; true; end
    end
    state :confirmed do
      def solved?; true; end
    end
  end
end
