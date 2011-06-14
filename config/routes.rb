Scavenge::Application.routes.draw do
  resources :teams

  resources :clues

  resources :questions

  resources :solutions
end
