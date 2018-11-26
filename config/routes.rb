Rails.application.routes.draw do
  get 'users/new'
  get '/help',	to: 'static_pages#help'
  get '/contact',	to: 'static_pages#contact'
  get '/about',	to: 'static_pages#about'
  get '/signup',	to: 'users#new'
  resources :books
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
