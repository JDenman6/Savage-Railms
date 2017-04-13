Rails.application.routes.draw do
  resources :users
  resources :character_skills
  resources :character_attributes
  resources :characters
  root 'characters#index'
  get  '/characters/:id/roll', to: 'characters#roll'
  get 'signup'  => 'users#new'

end
