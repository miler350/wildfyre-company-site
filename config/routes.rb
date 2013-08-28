WildfyreSite::Application.routes.draw do
  get "uploads/index"
  get "uploads/create"
  get "uploads/destroy"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :projects do
    resources :comments 
    resources :uploads
    resources :notes
  end

  resources :contacts
root :to => "main#index"
end
