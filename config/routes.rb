Rails.application.routes.draw do
  devise_for :users, :sign_out_via => [ :post, :get ]
  root to: "pages#index"

  get '/projects/:id' => 'projects#destroy'
  get '/tasks/:id' => 'tasks#destroy'
#  get '/users/sign_out' => 'devise/sessions#destroy'
#  match '/users/sign_out', via: [:get, :post]
  resources :projects
  resources :tasks

  post '/update_tasks_order/:id' => 'projects#update_tasks_order'

end
