Rails.application.routes.draw do
  resources :contributors
  root 'contributors#index'
end
