WildfyreSite::Application.routes.draw do
  # all static pages -------------------------
  get '/companies' => 'pages#companies'
  get '/projects' => 'pages#projects'
  get '/partners' => 'pages#partners'
  get '/network' => 'pages#network'
  get '/ethos' => 'pages#ethos'
  get '/start_up' => 'pages#start_up'
  get '/ventures' => 'pages#ventures'
  get '/advisory' => 'pages#advisory'
  get '/real_estate' => 'pages#real_estate'
  # end of static pages ----------------------
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
