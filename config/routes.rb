Rails.application.routes.draw do
  resources :atoms

  get :app, controller: :view
end
