Rails.application.routes.draw do
  devise_for :users,
             path: 'v1',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'v1/users/sessions',
               registrations: 'v1/users/registrations'
             }

  namespace 'v1' do
    get 'current_user', to: 'current_user#index'
  end
end
