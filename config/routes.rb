Rails.application.routes.draw do

  resources :cocktails, only: [:index, :show, :new, :create] do
    # resources :doses, only: [:new, :create] // pour faire plaisir au rake
    resources :doses, only: [:new, :create, :destroy]
  end

  # resources :doses, only: [:destroy] // pour faire plaisir au rake

  root 'cocktails#index'
end
