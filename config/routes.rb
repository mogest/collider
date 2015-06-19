Rails.application.routes.draw do
  resources :atoms, only: [:index, :show, :new, :create, :update]

  resources :elements, only: :index do
    get 'atoms/new' => 'atoms#new'
  end

  get :app, controller: :view
end
