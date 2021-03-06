Rails.application.routes.draw do
  root 'static_pages#home'
  resources :books
  scope '/rentals' do
    get '/', to: 'rentals#index', as: 'rentals'
    post '/create/:id', to: 'rentals#create', as: 'rental_create'
    post '/finish/:id', to: 'rentals#finish', as: 'rental_finish'
  end
  resources :users
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'sign_in', to: 'static_pages#home', as: 'new_user_session'
    get 'sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
