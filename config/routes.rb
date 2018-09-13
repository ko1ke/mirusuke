Rails.application.routes.draw do
  root 'schedules#index'
  get 'schedules/:type_id', to: 'schedules#new', as: 'new_schedule'
  resources :schedules, only: [:create, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
