Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}

  resources :tickets, except: [:edit, :update]

  namespace :admin do
    resources :railway_stations
    resources :routes
    resources :tickets
    resources :trains do
      resources :carriages, shallow: true
    end
  end

  get 'search' => 'search#index'
  get 'about' => 'about#index'

  root 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
