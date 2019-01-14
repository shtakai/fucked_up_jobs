Rails.application.routes.draw do
  require 'sidekiq/web'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'niku' => 'posts#niku'
  mount Sidekiq::Web => '/sidekiq'
end
