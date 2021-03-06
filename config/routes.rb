Rails.application.routes.draw do
    devise_for :users
    get 'users/show'
    root to: 'homes#top'
    get "home/about" => "homes#about"
    resources :users, only: [:show, :edit, :update, :index, ] 
    resources :books, only: [:create, :new, :index, :show, :destroy, :edit, :update] do
        resources :book_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
    end

    get "/search" => "searches#search"
    
    resources :users do
        get :follower, on: :member
        get :followed, on: :member
    end
        
    post 'follow/:id' => 'relationships#create', as: 'follow' 
    post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' 
    post "/users/:id" => "books#create"
    post "/books" => "books#create"
end