Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users
  root to: 'topics#index'
  resources :topics, except: [:destroy, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
