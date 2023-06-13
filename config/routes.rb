Rails.application.routes.draw do
 
  root 'static_pages#Home'

  get 'static_pages/Contact'
  get 'static_pages/Notre_histoire'
  get 'static_pages/Nos_partenaires'

  devise_for :users
  resources :items
end
 

