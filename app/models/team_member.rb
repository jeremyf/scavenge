class TeamMember < User
  belongs_to :team
  validates_presence_of :team_id

  attr_accessible :email, :password, :password_confirmation, :remember_me, :team_id

  def purchase(clue)
    solution = Solution.where(:team_id => team_id, :question_id => clue.question_id).first
    solution.purchased_clues << clue
  end
end