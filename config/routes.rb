Rails.application.routes.draw do
  devise_for :users, :controllers => {
      :invitations => 'users/invitations',
      :registrations => 'users/registrations'
  }
  root 'schedules#index'
  resources :schedules, only: [:new, :create, :show, :edit, :update, :destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
