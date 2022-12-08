Rails.application.routes.draw do
  get 'home/index'
  get 'terms' =>'pages#terms'
  get 'about' => 'pages#about'
  # get 'contacts' => 'contacts#new'
  resources :articles
  resources :contacts, only: [:new, :create], path_names: {:new => ''}
  resource :terms

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
