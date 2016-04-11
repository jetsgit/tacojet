Rails.application.routes.draw do
  root controller: 'stores', action: :tacos_salsas
  resources :stores
  get 'tacos-salsas' => 'stores#tacos_salsas'
  post 'taco-heaven' => 'stores#taco_heaven'

end
