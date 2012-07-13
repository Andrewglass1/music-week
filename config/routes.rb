MusicWeek::Application.routes.draw do

  resources :signups
  resources :albums
  resources :albums do
    resources :songs, :only => [:create, :destroy]
  end

  match '/dashboard' => 'signups#index'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  root :to => "albums#index"
  resources :users
  resources :sessions
end
