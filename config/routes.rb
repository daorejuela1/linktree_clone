Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#index'
  get '/user/new', to: 'profiles#new'
  post 'user/post', to: 'profiles#create', as: 'users'
  get '/:username', to: 'profiles#show'
  patch '/:username/edit', to: 'profiles#update', as: 'user_edit'
end
