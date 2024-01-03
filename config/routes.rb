# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      defaults format: :json
      resources :users do
        resources :projects
        resources :articles
        resources :videos
        resources :testimonials
        resources :skills
        resources :experiences do
          resources :job_descriptions
        end
      end
    end
  end
end
