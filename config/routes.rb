Rails.application.routes.draw do
  resources :users, only: [:index] do
    member do
      resources :playlists, only: [:index]
      delete "remove_song/:song_id", to: 'playlists#remove_song', as: 'remove_song'
    end
  end

  resources :songs
  devise_for :users, controllers: {
      registrations: 'users/registrations'
      }

  post "playlists/:song_id/add_song", as: "add_song", to: 'playlists#add_song'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'songs#index'
end
