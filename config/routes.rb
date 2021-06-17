Rails.application.routes.draw do
<<<<<<< HEAD

    namespace :admin do
      root "application#index"
      resources :users, only: [:index]
    end

=======
  namespace :admin do
    root "application#index"
    resources :users, only: [:index]
  end
>>>>>>> admin_area
    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :users, only: [:show]

    root "events#index" #ovo postavlja root stranicu da nebude Rails defaultni welcome page

    resources :events
end
