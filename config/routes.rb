Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :users, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :show, :new, :create]
    resources :possessions, only: [:index]
    resources :auth, only: [:new, :create]
    resources :graves, only: [:index, :new, :create]

    get '/possessions/create', to: "possessions#create"
    post '/possessions/create', to: "possessions#create"

    get '/possessions/delete', to: "items#delete"
    delete '/possessions/delete', to: "items#delete"

    get '/users/die', to: "users#die"
    post '/users/die', to: "users#die"

    get '/graves/create', to: "graves#create"
    post '/graves/create', to: "graves#create"

    get '/signup', to: "auth#new"
    post '/users', to: "auth#create"

    get '/login', to: "auth#signin"
    post '/login', to: "auth#verify"

    get '/logout', to: "auth#logout" 
    root 'users#index'
end
