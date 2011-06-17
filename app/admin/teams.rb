ActiveAdmin.register Team do

  index do
    column :name
    column 'Members' do |team|
      link_to team.team_members.count, admin_team_members_path(:q => {:team_id_eq => team[:id]})
    end
    column 'Solutions' do |team|
      link_to team.solutions.count, admin_solutions_path(:q => {:team_id_eq => team[:id]})
    end
    default_actions
  end
end
