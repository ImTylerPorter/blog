Rails.application.routes.draw do
  
  get 'profiles/show'

  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]

 get ':nick_name', to: 'profiles#show', as: :profile
  get 'welcome/index'

  root 'welcome#index'

 get '*path' => redirect('/')

end
