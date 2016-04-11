Rails.application.routes.draw do
  root controller: 'stores', action: :tacos_salsas
  get 'tacos-salsas' => 'stores#tacos_salsas'
  post 'taco-heaven' => 'stores#taco_heaven'

end
