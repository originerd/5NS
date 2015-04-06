Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :nanoposts, only: [:index, :show, :create, :destroy]
end
