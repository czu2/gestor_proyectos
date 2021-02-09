Rails.application.routes.draw do
  get 'pages/new'
  post 'pages/create'
  get 'pages/index'

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
