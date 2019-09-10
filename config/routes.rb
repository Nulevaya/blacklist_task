Rails.application.routes.draw do
  get '/', to: redirect(path: '/customers')
  get '/customers/:id', to: redirect('/customers/%{id}/edit')

  resources :customers, only: [:index, :edit, :update] do
    member do
      post :blacklist
    end
  end

  resources :blacklisted_customers, only: [:index] do
    collection do
      post :blacklist_by_phone
    end

    member do
      post :unblacklist
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
