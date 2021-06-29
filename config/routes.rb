Rails.application.routes.draw do
  namespace :admin do
    root "application#index"
    resources :users, only: [:index]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :comments, only: [:index]
    resources :attendances, only: [:index]
  end
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :users, only: [:show]
    resources :categories, only: [:show]

    root "events#index" #ovo postavlja root stranicu da nebude Rails defaultni welcome page

    resources :events do
      resources :likes, only: [:create]
      resources :comments, only: [:create]   #ovo se zove "nested resources"
      resources :attendances, only: [:create]
    end

end
