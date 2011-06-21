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

  def self.propose(team_member, possible_question, attachment)
    team = team_member.team
    question = Question.find(possible_question)

    where(:team_id => team[:id]).where(:question_id => question[:id]).first.tap do |solution|
      solution.propose_solution(attachment)
    end
  end

  def propose_solution(attachment)
    solve!
  end

  state_machine :state, :initial => :open do
    event :solve do
      transition :open => :pending
    end

    event :confirm do
      transition :pending => :confirmed
    end

    state :open
    state :pending
    state :confirmed
  end

  def solved?
    !open?
  end
end
