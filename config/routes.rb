Rails.application.routes.draw do
  root to: "bottle#index"
  resources :bottle do
    collection do
      get 'search'
    end
  end

end
