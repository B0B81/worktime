Rails.application.routes.draw do
  devise_for :users

  resources :workfiles do
    resources :timestamps
  end

  root "workfiles#index"

end
