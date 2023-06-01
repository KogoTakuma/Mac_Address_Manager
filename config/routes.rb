Rails.application.routes.draw do
  get 'electronic', to: 'electronics#index'
  get 'command/generate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/command', to: 'command#generate'
  get '/command/user', to: 'command#output_user'
  get '/user', to: 'users#index'
  post '/user/import', to: 'users#import'
  post '/electronic/import', to: 'electronics#import'
  get '/user/pre_import', to: 'users#pre_import'
  get '/electronic/pre_import', to: 'electronics#pre_import'
  root to: 'homes#index'

end
