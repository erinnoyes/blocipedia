Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  resources :users do
    member do
      get :unconfirmed_email
    end
  end 

end
