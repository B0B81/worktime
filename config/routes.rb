Rails.application.routes.draw do
  devise_for :users

  resources :workfiles do
    resources :timestamps
  end

  root "workfiles#index"


  resources :orders do
    collection do
      get 'get_order_description'
    end
  end


end
