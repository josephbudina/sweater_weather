Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :forecasts, only: [:index]
      resources :salaries, only: [:index]
      resources :backgrounds, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :road_trips, only: [:create]
    end
  end
end
