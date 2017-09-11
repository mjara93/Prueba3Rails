Rails.application.routes.draw do
  resources :songs
  devise_for :users, controllers: {

      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
