Rails.application.routes.draw do
  root controller: 'stores', action: :tacos_salsas

  get 'connecting' => 'connecting#index'
  get 'schema' => 'schema#index'
  resources :questions
  resources :coding_challenge, only: [:index]

  resources :stores
  get 'tacos-salsas' => 'stores#tacos_salsas'
  post 'taco-heaven' => 'stores#taco_heaven'

end
