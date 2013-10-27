Wolf::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :questions, only: [:index]
        resources :answers, only: [:index]
        resources :points, only: [:index]
        resources :answerables, only: [:index]
      end
      resources :questions, only: [:create, :update, :show, :index]
      resources :user_categories, only: [:create]
      resources :categories, only: [:index]
      resources :devices, only: [:create]
    end
  end
end
