Rails.application.routes.draw do
  resources :develop, only: [:create] do
    collection do
      post 'other_db_create'
    end
  end
  resources :other_develop, only: [:create]
end
