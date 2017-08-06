Rails.application.routes.draw do
  root to: 'sessions#new'
  # namespace :admin do
    # resources :workshops
  # end

  resources :workshops do
    resources :feedbacks
  end

  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, :path => '/sessions', :only => [:new, :create, :destroy]

end
