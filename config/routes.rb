Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'registrations'
      }

  get 'welcome/about'

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  unauthenticated :user do
    get 'welcome/intro', as: :unauthenticated_root
  end

  resources :users do
    resources :requests, except: [:new]
  end

  resources :requests, only: [:new]

  root 'welcome#intro'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
