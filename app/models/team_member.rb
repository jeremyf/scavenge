class TeamMember < User
  has_and_belongs_to_many :teams
end