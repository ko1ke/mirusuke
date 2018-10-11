Rails.application.routes.draw do
  devise_for :users, :controllers => {
      :invitations => 'users/invitations',
      :registrations => 'users/registrations'
  }
  root 'schedules#index'
  resources :schedules, only: [:index, :new, :create, :destroy]
  get 'schedules/index_of_group', to: 'schedules#index_of_group', as: 'index_of_group'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
