Rails.application.routes.draw do
  get  'pages/new'
  post 'pages/create', to: 'pages#create'
  get  'pages/index'

  root 'pages#index'
end
