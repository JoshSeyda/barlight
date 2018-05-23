Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users do 
    resources :schedules
    resources :venues
    resources :regulars
  end
  resources :events
  resources :recurring_events
end

