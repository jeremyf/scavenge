Scavenge::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  match '/' => 'home#index', :as => :home
  match '/' => 'home#index', :as => :root

  match '/purchase_clue/:clue_id' => 'home#purchase_clue', :as => :purchase_clue, :method => :post

  devise_for :team_members, :controllers => { :sessions => "sessions" }
end
