Rails.application.routes.draw do
  resources :lists
  
  root 'lists#index' 
  get 'home/delete_completed_todos'
  get 'home/delete_all_todos'
end
