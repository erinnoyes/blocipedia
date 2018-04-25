Rails.application.routes.draw do
  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

  resources :users do
    member do
      get :unconfirmed_email
    end
  end

end
