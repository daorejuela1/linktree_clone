Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#index'
  get '/user/new', to: 'profiles#new'
  post 'user/post', to: 'profiles#create', as: 'users'
  get '/:username', to: 'profiles#show'
  get '/:username/edit', to: 'profiles#edit'
  patch '/:username/edit', to: 'profiles#update', as: 'user_edit'
  get '/:username/delete', to: 'profiles#delete', as: 'user_delete'
  delete '/:username/delete', to: 'profiles#delete'
end
