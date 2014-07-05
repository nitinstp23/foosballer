Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, defaults: {format: 'json'} do
    resources :tournaments
    resources :players, only: [:index]
  end

end
