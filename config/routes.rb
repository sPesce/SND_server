Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        get 'find_user' => 'users#find'
        resources :users
      end
    end
end