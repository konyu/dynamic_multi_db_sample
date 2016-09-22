Rails.application.routes.draw do
  resources :channging_ctrl, only: [:create] do
    collection do
      post 'other_db_create'
    end
  end
  resources :channging_model, only: [:create]
end
