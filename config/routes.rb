Rails.application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }
  root 'schedules#index'
  resources :schedules, only: [:new, :create, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
