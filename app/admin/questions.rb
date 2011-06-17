ActiveAdmin.register Question do
  index do
    column :name
    column :answer
    column :possible_points
    column 'Clues' do |question|
      link_to question.clues.count, admin_clues_path(:q => {:question_id_eq => question[:id]})
    end
    default_actions
  end
end
