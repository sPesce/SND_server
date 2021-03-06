Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        get 'find_user' => 'users#find'
        patch 'users/update' => 'users#update'
        post 'find_matches' => 'users#get_closest_matches'
        post 'caretaker_request' => 'users#caretaker_request'
        get 'caretaker_remove' => 'users#caretaker_remove'
        get 'caretaker' => 'users#caretaker'
        patch 'accept_caretaker' => 'users#accept_caretaker'
        post 'send_match' => 'users#initialize_match'
        patch 'matches/accept/' => 'matches#accept_match'


        post '/login', to: "authentication#create"

        resources :disabilities, only: [:index,:create]
        resources :interests, only: [:create]
        resources :matches, only: [:index]

        resources :users
      end
    end
end
