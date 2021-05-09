Rails.application.routes.draw do
  resources :attending_events
  resources :attendings
  resources :events
  resources :categories
  resources :users
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
