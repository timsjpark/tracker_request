Rails.application.routes.draw do
  mount Resque::Server.new, at: '/resque'

  root 'home#index'
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'

  get '/auth/github/callback', to: 'sessions#oauth'

  delete 'logout' => 'sessions#destroy'

  get 'console' => 'console#index'
  get 'console/profile' => 'console#profile', :as => :user
  get 'console/statistics'
  get 'console/repo-count' => 'console#repo-count'
  get 'console/:repo_id/info' => 'console#repo-info', :as => :repo_info
end
