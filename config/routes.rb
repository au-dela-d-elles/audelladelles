Rails.application.routes.draw do
  root 'static_pages#Home'
  get 'static_pages/Contact'
  get 'static_pages/About'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
