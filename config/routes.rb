Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             path: 'api/v1',
             path_names: {
               sign_in: 'users/sessions',
               sign_out: 'logout',
               registration: 'users'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }        
  get 'api/v1/books', to: 'books#index'
  get 'api/v1/books/:id', to: 'books#show'

  post 'api/v1/books/suggestions', to: 'book_suggestions#create'

  get 'api/v1/rents', to: 'rents#index'
  post 'api/v1/rents', to: 'rents#create'

  get 'api/v1/openlibrary/', to: 'open_library#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
