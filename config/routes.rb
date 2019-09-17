Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/olympian_stats', to: 'stats#show'
      get '/events', to: 'events#index'
      resources :olympians, only: [:index]
    end
  end
end
