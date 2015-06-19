Rails.application.routes.draw do
  resources :atoms, only: [:index, :show, :new, :create, :update] do
    member do
      get :children
    end
  end

  resources :elements, only: :index do
    get 'atoms/new' => 'atoms#new'
  end

  get :app, controller: :view
end
