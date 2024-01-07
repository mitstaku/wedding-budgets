Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :events do
    resources :event_quotes do
      get :new_food, on: :collection
      get :new_costume, on: :collection
      get :new_beauty, on: :collection
      get :new_flower, on: :collection
      get :new_print, on: :collection
      get :new_staging, on: :collection
      get :new_photo, on: :collection
      get :new_video, on: :collection
      get :new_gift, on: :collection
      get :new_pre_ceremony, on: :collection
    end
  end
end