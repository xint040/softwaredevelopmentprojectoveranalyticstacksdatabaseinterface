Rails.application.routes.draw do
  devise_for :readers
  resources :learners_notes
  resources :stylish_applications
  resources :references
  resources :fundamental_questions
  resources :learners_discussions
  resources :stacks_as_the_sheaves_categories
  resources :prestacks_as_the_presheaves_categories
  resources :grothendieck_sites_categories
  resources :rings_categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "stacks_as_the_sheaves_categories#index"


  devise_scope :reader do
    get '/readers/sign_out', to: "devise/sessions#destroy", as: "delete_current_reader_session"
    get '/readers/sign_in', to: "devise/sessions#create", as: "create_a_reader_session"
  end

  
  

end
