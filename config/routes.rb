Rails.application.routes.draw do
  apipie
  devise_for :users, skip: :all
  namespace :api, defaults: {format: :json} do
    resources :books
    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "log_in", to: "sessions#create"
    end
    resources :users
    resources :categories, only: :index
  end
end
