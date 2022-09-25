Rails.application.routes.draw do

  devise_for :admins

  resources :documents do
    collection do
      get "search"
    end
  end

  resources :keys do
    collection do
      get "search"
    end
  end

  resources :couplets do
    collection do
      get "search"
    end
  end

  resources :leads do
    collection do
      get "search"
    end
  end

  resources :predicates, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :properties do
    collection do
      get "search"
    end
  end

  resources :taxons do
    collection do
      get "search"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "site#home"

end
