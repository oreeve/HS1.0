Rails.application.routes.draw do
  root 'cards#index'

  resources :cards, only: [:index]

  post "/" => "cards#index"
end
