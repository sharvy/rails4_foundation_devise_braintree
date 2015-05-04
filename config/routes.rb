Rails.application.routes.draw do

  resource :cart, only: [:show] do
    member do
      put 'add/:movie_id', to: 'carts#add', as: :add_to
      put 'remove/:movie_id', to: 'carts#remove', as: :remove_from
    end
  end

  devise_for :users, path_name: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :movies
  root 'movies#index'

end
