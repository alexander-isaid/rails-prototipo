Rails.application.routes.draw do
  resources :posts
  resources :clientes
  resources :posts do
    member do
      post :autorizar 
    end
  end
  devise_for :clients
  resources :usuarios

  resources :audit_logs
  devise_for :users, skip: [:registration]
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  resources :transacciones, only: %i[:index, :new, :create, :show]


  get 'transacciones/purchase/new', to: 'transacciones#new_purchase', as: 'new_purchase'
  get 'transacciones/reversal/new', to: 'transacciones#new_reversal', as: 'new_reversal'
  get 'transacciones/withdrawal/new', to: 'transacciones#new_withdrawal', as: 'new_withdrawal'
  get 'transacciones/deposit/new', to: 'transacciones#new_deposit', as: 'new_deposit'
  get 'transacciones/payment/new', to: 'transacciones#new_payment', as: 'new_payment'
  get 'transacciones/transfer/new', to: 'transacciones#new_transfer', as: 'new_transfer'
  
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      get :ping, to: "hellcheck#ping"
            end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
