Rails.application.routes.draw do
  get 'command/generate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/command', to: 'command#generate'
end
