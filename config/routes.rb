Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :carts
      resources :items
      resources :orders

      root to: "users#index"
    end
    
  resources :orders, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]
  resources :items
  
  root 'static_pages#Home'
  
  get 'static_pages/Contact'
  post 'static_pages/Contact', to: 'contacts#create', as: 'contact_submit'
  get 'static_pages/Notre_histoire'
  get 'static_pages/Nos_partenaires'
  get 'static_pages/Mention_legal'
  get 'static_pages/Conditions_generales'
  get 'static_pages/Cgu'

  devise_for :users, controllers: { registrations: 'users/registrations' }


  scope '/checkout' do
    post 'total', to: 'checkout#total', as: 'checkout_total'
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  end
 

