Rails.application.routes.draw do
  resources :alarm
  root 'alarm#index'
end
