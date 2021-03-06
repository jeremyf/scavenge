ActiveAdmin.register Solution do
  menu :parent => 'Teams'

  index do
    column :team do |solution|
      link_to solution.team, admin_teams_path(:q => {:id_eq => solution.team[:id]})
    end
    column :question do |solution|
      link_to solution.question, admin_questions_path(:q => {:id_eq => solution.question[:id]})
    end
    column :clues do |solution|
      ul
        solution.clues.each do |clue|
          li clue, :class => dom_class(clue)
        end
    end
    column :image do |solution|
      if solution.solved?
        img :src => solution.proposed_solution.url, :height => 64, :width => 64
      else
        '&nbsp;'.html_safe
      end
    end
    default_actions
  end

  form :partial => 'form'
end
