Rails.application.routes.draw do
  root to: 'books#index'

  resources :books, only:[:index] do
    resources :orders, only:[:index, :create]
  end
end
