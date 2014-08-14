TestApp::Application.routes.draw do
  devise_for :users
  root to: "home#index"

  resource :account, only: [:edit, :update]
  resources :photos, only: [:index, :create, :destroy]

end
