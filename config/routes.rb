Rails.application.routes.draw do
  get 'cart/show'
  resources :products
 
  root 'static_pages#Home'

  get 'static_pages/Contact'
  get 'static_pages/Notre_histoire'
  get 'static_pages/Nos_partenaires'

  devise_for :users

  scope '/checkout' do
    post 'total', to: 'checkout#total', as: 'checkout_total'
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
 

