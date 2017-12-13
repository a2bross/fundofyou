Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # JUST POUR LE TEST
  get 'test', to: "pages#test"
  # route for chosing your criteria
  get 'edit_criteria', to: 'users#edit_criteria', as: :edit_criteria

  # route for submitting your criteria
  patch 'edit_criteria', to: 'users#update_criteria'

  # route for display recommanded project
  get 'result', to: 'users#result'

  # user route for show (user dashboard)
  resources :users, only: :show do
    # route for donation
    resources :donations, only: :create
  end

  # route for order and payment
  resources :orders, only: [:create, :update] do
      resources :payments, only: [:new, :create]
  end

  # adding all CRUD routes for projects in order for admins to be able to add projects more easily
  resources :projects

  # adding all CRUD routes for projects in order for admins to be able to add projects more easily
  resources :charities

  # subscription routes (to allow users to cancel (== edit) their subscription)
  resources :subscriptions, only: [:new, :create, :edit, :update]

end
