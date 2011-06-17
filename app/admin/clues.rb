ActiveAdmin.register Clue do
  menu :parent => 'Questions'
  index do
    column :question do |clue|
      link_to clue.question, admin_questions_path(:q => {:id_eq => clue.question[:id]})
    end
    column :name
    column :point_cost
    default_actions
  end
end
