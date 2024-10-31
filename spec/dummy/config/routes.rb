Rails.application.routes.draw do
  mount InkComponents::Engine => "/ink_components"

  resources :users, only: [ :new, :create ]
end
