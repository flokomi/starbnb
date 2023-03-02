Rails.application.routes.draw do
  get 'reservations/create'
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :spaceships, only: %i[index show new create edit update] do
    resources :reservations, only: [:create]
  end

  get "dashboard", to: 'reservations#dashboard'
  delete 'spaceships/:id', to: 'spaceships#destroy', as: :spaceship_destroy
end
