class Solution < ActiveRecord::Base
  RESPONSES = ['Accept', 'Reject']
  belongs_to :question
  belongs_to :team
  has_and_belongs_to_many :purchased_clues, :join_table => 'clues_solutions', :class_name => 'Clue'
  mount_uploader :proposed_solution, ProposedSolutionUploader

  delegate :possible_points, :to => :question

  def email_subject
    question[:id].to_s
  end

  def clues
    return @clues if @clues
    @clues = []
    question.clues.inject(@clues) {|mem, clue|
      clue.singleton_class.send(:attr_writer, :purchased)
      clue.purchased = purchased_clues.include?(clue)
      def clue.purchased?
        !!@purchased
      end
      mem << clue
    }
    @clues
  end

  def possible_points_still_available
    possible_points - points_spent_on_clues
  end

  def points_spent_on_clues
    purchased_clues.sum(:point_cost)
  end

  def to_s
    question.to_s
  end

  def score
    @score ||= Score.new([self])
  end

  attr_reader :response_for_proposed_solution
  def response_for_proposed_solution=(value)
    RESPONSES.each do |response|
      send(response.downcase) if value.to_s.downcase == response.downcase
    end
  end

  def points_awarded
    return 0 unless solved?
    return @points_awarded if defined?(@points_awarded)
    @points_awarded = possible_points - points_spent_on_clues
    @points_awarded = 0 if @points_awarded < 0
    @points_awarded
  end

  def self.purchase_clue(team_member, clue)
    team = team_member.respond_to?(:team) ? team_member.team : TeamMember.include(:team).find(team_member).team
    clue = clue.respond_to?(:question_id) ? clue : Clue.find(clue).includes(:question)
    question = clue.question
    where(:team_id => team[:id]).where(:question_id => question[:id]).first.tap do |solution|
      begin
        solution.purchased_clues << clue unless solution.purchased_clues.include?(clue)
      rescue ActiveRecord::StatementInvalid => e
        true # this was already solved, no worries
      end
    end
    return true
  end

  def self.propose(team_member, possible_question, attachment)
    team = team_member.team
    question = Question.find(possible_question)

    where(:team_id => team[:id]).where(:question_id => question[:id]).first.tap do |solution|
      solution.propose_solution(attachment)
    end
  end

  def propose_solution(attachment)
    self.proposed_solution = attachment
    solve!
  end

  state_machine :state, :initial => :open do
    event :solve do
      transition :open => :pending
    end

    event :accept do
      transition [:rejected, :pending] => :accepted
    end

    event :reject do
      transition [:accepted, :pending] => :rejected
    end

    state :open
    state :pending
    state :accepted
    state :rejected
  end

  def solved?
    !open?
  end
end
