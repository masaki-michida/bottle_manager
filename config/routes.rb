Rails.application.routes.draw do
  root to: "bottle#index"
  resources :bottle do
    collection do
      get 'search'
      get 'get_local_number'
    end
  end

end
