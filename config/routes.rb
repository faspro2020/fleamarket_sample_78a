Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'items#index'
  resources :items, only: [:new, :show, :create]
  resources :mypages, only: :index do
    collection do
      get 'logout'
    end
  end
  scope :mypages do
    resources :cards, only: [:index, :new]
  end
end