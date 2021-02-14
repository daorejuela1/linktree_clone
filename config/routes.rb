Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index" 
  get "/user/new", to: "registrations#new"
  post "users", to: "registrations#create"
end
