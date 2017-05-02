Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources  :users, :trips, :comments, :home, :paris, :oahu, :cuba
  root "home#index"

end
