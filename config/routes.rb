Rails.application.routes.draw do
  devise_for :users, skip: :all
  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "log_in", to: "sessions#create"
    end
  end
end
