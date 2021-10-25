Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
     resources :contacts
      get 'contacts', to: 'contacts#index'
    end
  end
end
