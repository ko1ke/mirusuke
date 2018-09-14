Rails.application.routes.draw do
  root 'schedules#index'
  resources :schedules, only: [:new, :create, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
