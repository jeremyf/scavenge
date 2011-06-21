class TeamMember < User
  belongs_to :team
  validates_presence_of :team_id

  attr_accessible :email, :password, :password_confirmation, :remember_me, :team_id

  def propose_solution_via_email(*args)
  end
end