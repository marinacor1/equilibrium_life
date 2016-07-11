Rails.application.routes.draw do
  root 'welcome#index'
  get '/logout', to: 'sessions#destroy', as: :logout
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :edit, :update]

  namespace :english do
    get '/description', to: 'description#index'
    get '/contact', to: 'contact#index'
  end

  namespace :espanol do
    get '/descripcion', to: 'description#index'
    get '/contacto', to: 'contact#index'
  end


  namespace :admin do
    get '/dashboard', to: 'users#show'
    resources :users, only: [:update, :delete, :index]
  end

end
