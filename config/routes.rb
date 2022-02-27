Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :profile
  resources :users

  match "/auth/:provider/callback", to: "sessions#create", via: %i[get post]

  root "home#index"
end
