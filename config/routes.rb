Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users do
    resources :services do
      resources :folders do
        resources :user_files
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
