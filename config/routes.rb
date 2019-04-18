Rails.application.routes.draw do
  resources :rooms, only: %i(index show new create)
  root to: 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
