Scavenge::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  match '/' => 'home#index', :as => :home
  match '/' => 'home#index', :as => :root

  devise_for :team_members, :controllers => { :sessions => "sessions" }
end
