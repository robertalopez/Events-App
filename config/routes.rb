Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#logout'
  get 'about', to: 'sessions#about' , as: 'about'

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users do #  routes /users/:id/attendances/new
    resources :attendances, only: [:new]
  end

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :events do #  routes /events/:id/attendances/new
    resources :attendances, only: [:new]
  end

  resources :categories, only: [:index, :show, :new, :create]

  resources :attendances, only: [:new, :create]
end


# resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
# resources :users do #  routes /users/:id/attendances/new
#   resources :attendances, only: [:new]
# end