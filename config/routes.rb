Rails.application.routes.draw do
  devise_for :users,
             path: 'api/v1',
             path_names: {
               sign_in: 'users/sessions',
               sign_out: 'logout',
               registration: 'users'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
             
  get 'api/v1/books', to: 'books#index'
  get 'api/v1/books/:id', to: 'books#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
