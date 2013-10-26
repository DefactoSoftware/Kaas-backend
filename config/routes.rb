Wolf::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :questions, only: [:index]
      end
      resources :questions, only: [:create, :update, :show]
      resources :user_categories, only: [:create]
      resources :categories, only: [:index]
      resources :devices, only: [:create]
    end
  end
end
