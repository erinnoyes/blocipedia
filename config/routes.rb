Rails.application.routes.draw do
  get 'users/downgrade'

  get 'users/show'

  get 'downgrade/show'

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end 

  devise_for :users

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  root 'welcome#index'


  resources :users do
    member do
      get :unconfirmed_email
    end
  end

end
