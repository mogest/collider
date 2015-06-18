Rails.application.routes.draw do
  resources :atoms, only: [:index, :show, :create, :update]

  resources :elements, only: :index do
    get 'atoms/new' => 'atoms#new'
  end

  get :app, controller: :view
end
