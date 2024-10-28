Rails.application.routes.draw do
  mount InkComponents::Engine => "/ink_components"

  resources :users, only: [ :new, :create ]
  resources :weeks, only: [ :new, :create ]
  namespace :admin do
    resources :groups, only: [ :new, :create ]
  end
end
