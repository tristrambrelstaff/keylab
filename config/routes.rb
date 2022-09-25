Rails.application.routes.draw do

  devise_for :admins

  resources :documents do
    collection do
      get "search"
    end
  end

  resources :keys, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :couplets, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :leads, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :predicates, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :properties, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :taxons, :only => [:index, :show] do
    collection do
      get "search"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "site#home"

end
