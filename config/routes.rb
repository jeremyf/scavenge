Scavenge::Application.routes.draw do
  devise_for :users

  resources :teams

  resources :clues

  resources :questions

  resources :solutions

  root :to => "home#index"
end
