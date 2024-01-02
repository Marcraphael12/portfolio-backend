Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
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
