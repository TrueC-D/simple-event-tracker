Rails.application.routes.draw do
  resources :statuses
  resources :categories
  resources :users
  resources :events do 
    resources :attending_events
  end

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'about', to: 'users#about'

  
  get '/auth/facebook/callback' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
