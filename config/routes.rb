Rails.application.routes.draw do
  root to: "bottles#index"
  post '/bottles', to: 'bottles#create'
  resources :bottles do
    collection do
      get 'get_search_nickname'
      get 'get_local_number'
    end
  end

end
