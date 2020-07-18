Rails.application.routes.draw do
  root to: "bottle#index"
  resources :bottle do
    collection do
      get 'get_search_nickname'
      get 'get_local_number'
    end
  end

end
