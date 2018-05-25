Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'tenders#index'
  resources :users do 
    resources :regulars
  end
  get '/search' => 'regulars#search', :as => 'search_page'
  get '/calculator' => 'users#calculator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end


