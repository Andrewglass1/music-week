MusicWeek::Application.routes.draw do

  root :to => 'welcome#show'
  resources :signups
  resources :albums
  resources :albums do
    resources :songs, :only => [:create, :destroy]
  end
  match '/dashboard' => 'signups#index'
  match '/uploaded' => 'albums#uploaded'
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
end
