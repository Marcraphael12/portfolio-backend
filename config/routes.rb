Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :projects
        resources :articles
      end
    end
  end
end
