ActiveAdmin.register TeamMember do
  menu :parent => 'Teams', :label => "Members"
  filter :team
  filter :email
  index do
    column :team
    column :email
    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation, :required => true
      f.input :teams
    end
  end
end
