Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :movies, param: :slug
    resources :categories
  end
  namespace :api do
    post 'save-rating', to: 'ratings#save'
  end
  resources :movies, only: [:index, :show], param: :slug
  resources :categories, only: [:show], param: :slug
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
end
