Rails.application.routes.draw do
  root to: 'sessions#new'

  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, :path => '/sessions', :only => [:new, :create, :destroy]

  resources :workshops, :path => '/workshops', :only => [:index, :show] do
    resources :feedbacks
  end

  namespace :admin do
    resources :workshops do
      resources :feedbacks
    end
  end
end
