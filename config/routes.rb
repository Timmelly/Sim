Rails.application.routes.draw do
  get 'admin_api/computer_states'

  get 'admin_api/screenshot'

  get 'admin_api/reboot'

  get 'admin_api/user_info'

  get 'admin_api/change_password'

  get 'admin_api/logout'

  get 'admin_api/user_block'

  get 'admin_api/user_proccesses'

  resources :last_system_changings
  resources :computer_statuses
  resources :tokens
  resources :users
  resources :computers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
