Rails.application.routes.draw do

  root 'home#index'

  get '/auth/github/callback', to: 'sessions#oauth'

  delete 'logout' => 'sessions#destroy'

  get 'console' => 'console#index'
  get 'console/profile'
  get 'console/statistics'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get '/about' => 'home#about'
  get 'contact' => 'home#contact'
end
