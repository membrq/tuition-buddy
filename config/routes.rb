Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  get 'welcome/about'

  #authenticated :user do
    #root '', as: :authenticated_root 
  #end

  resources :users, only: [:new, :create]

  #add admin routes

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
