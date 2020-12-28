Rails.application.routes.draw do
  get 'home' => 'posts#index'
  post 'login' => 'users#login'
  post 'signup' => 'users#signup'
  post 'addPost' => 'posts#create'
end
