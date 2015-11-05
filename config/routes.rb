Rails.application.routes.draw do
  
  get 'pages/home'

  get 'profiles/show'

  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]

 get ':user_name', to: 'profiles#show', as: :profile
 get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
 patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  get 'welcome/index'


	authenticated :user do 
	  	root 'welcome#index', as: "authenticated_root"
	  end
	root 'pages#home'

 get '*path' => redirect('/')

end
