Rails.application.routes.draw do
  get 'electronic', to: 'electronics#index'
  get 'command/generate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/command', to: 'command#generate'
  get '/command/user', to: 'command#output_user'
  get '/user', to: 'users#index'
end
