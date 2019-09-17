Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/olympian_stats', to: 'stats#show'
      resources :olympians, only: [:index]
    end
  end
end
