Rails.application.routes.draw do

  get 'likes/create'

  get 'likes/destroy'

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  devise_for :users
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :nanoposts, only: [:index, :show, :create, :destroy] do
    resources :likes,    only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
