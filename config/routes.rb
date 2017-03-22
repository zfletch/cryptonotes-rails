Rails.application.routes.draw do
  root 'welcome#index'

  resources :notes, only: [:show, :new, :create, :update] do
    get 'search', on: :collection
  end
end
