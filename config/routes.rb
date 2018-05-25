Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'users#index'
  resources :users do 
    resources :regulars
  end
  resources :events
  resources :recurring_events
  get '/search' => 'regulars#search', :as => 'search_page'
  get '/calculator' => 'users#calculator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end


