Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources  :users, :trips, :comments, :home, :paris, :oahu, :cuba, :cuba_trips, :skyscanner, :image

  root to: "home#index"


end
