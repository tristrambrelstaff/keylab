Rails.application.routes.draw do

  resources :keys do
    collection do
      get "search"
    end
  end

  resources :documents do
    collection do
      get "search"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "keys#index"

end
