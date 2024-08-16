Rails.application.routes.draw do
  resources :examples
  mount InkComponents::Engine => "/ink_components"
end
