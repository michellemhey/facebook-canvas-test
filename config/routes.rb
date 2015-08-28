Rails.application.routes.draw do
  get '/facebook/channel', to: 'facebook#channel'
  get '/auth/:provider/callback', to: 'session#create'
  get '/auth/failure', to: 'session#destroy'

  get '/', to: 'home#index'
  get '/page1', to: 'home#page1'
  get '/page2', to: 'home#page2'
  get '/page3', to: 'home#page3'
end
