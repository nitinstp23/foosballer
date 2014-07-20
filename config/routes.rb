Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: 'json'} do

    resources :tournaments, except: [:edit, :destroy] do
      post :create_teams, on: :collection
    end

    resources :players, only: [:index]

  end

end
