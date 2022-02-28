Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :profile
  resources :users do
    resources :questions, only: :create
  end
  resources :unanswered_questions
  resources :questions, only: [] do
    resource :answer
  end

  match "/auth/:provider/callback", to: "sessions#create", via: %i[get post]

  root "home#index"
end
