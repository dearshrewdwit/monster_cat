# Routes

On page load the sessions#new controller is run.
```
root to: 'sessions#new'
```

We can define resources within the routes file and optionally specify the corresponding path and the routes we want to make available

```  
resources :sessions, :path => '/sessions', :only => [:new, :create, :destroy]
```

Users only have read access to workshop related data whereas admins specifically have full CRUD access to workshops.

```
namespace :admin do
  resources :workshops do
    resources :feedbacks
  end
end
```

Workshops have a relationship to feedbacks, and we can access that relationship RESTfully. i.e 'workshop/1/feedback/new'

```
resources :workshops, :path => '/workshops', :only => [:index, :show] do
  resources :feedbacks
end
```
