ActiveAdmin.register Solution do
  menu :parent => 'Teams'

  index do
    column :team do |solution|
      link_to solution.team, admin_teams_path(:q => {:id_eq => solution.team[:id]})
    end
    column :question do |solution|
      link_to solution.question, admin_questions_path(:q => {:id_eq => solution.question[:id]})
    end
    column :state_name
    default_actions
  end

  form :partial => 'form'
end
