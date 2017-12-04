Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # adding all CRUD routes for projects in order for admins to be able to add projects more easily
  resources :projects

  # user_criteria routes
  resources :user_criteria, only: [:edit, :update]

  # donation routes
  resources :donations, only: [:new, :create]

  # subscription routes (all CRUD routes for admin purposes, as well as to allow users to cancel (== edit) their subscription)
  resources :subscriptions, only: [:new, :create, :edit, :update]

  # user route for show (user dashboard)
  resources :user, only: :show

  # adding all CRUD routes for projects in order for admins to be able to add projects more easily
  resources :charities
end
