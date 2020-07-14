Rails.application.routes.draw do
  root to: "bottle#index"
  resources :bottle
end
