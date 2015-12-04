Rails.application.routes.draw do
  mount Resque::Server.new, at: '/resque'

  root 'home#index'
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'

  get '/auth/github/callback', to: 'sessions#oauth'

  delete 'logout' => 'sessions#destroy'

  get 'console' => 'console#index'
  get 'console/profile'
  get 'console/statistics'
end
