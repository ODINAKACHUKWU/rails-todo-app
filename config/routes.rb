Rails.application.routes.draw do
  resources :lists
  resources :users

  scope '/session' do
    get '/signin', to: 'sessions#new', as: 'new_session'
    get '/signup', to: 'sessions#new_signup'
    post '/signin', to: 'sessions#signin'
    post '/signup', to: 'sessions#signup'
    get '/signout', to: 'sessions#signout'
  end
  
  root 'home#index' 
  get 'home/delete_completed_todos'
  get 'home/delete_all_todos'
end
