Rails.application.routes.draw do
  mount Resque::Server.new, at: '/resque'
  resources :users, only: :update

  root 'home#index'
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'

  get '/auth/github/callback', to: 'sessions#oauth'

  delete 'logout' => 'sessions#destroy'

  get 'console' => 'console#index'
  get 'console/profile' => 'console#profile', :as => :profile
  get 'console/statistics'
  get 'console/repo-count' => 'console#repo-count'
  get 'console/:id/info' => 'console#info', :as => :repo_info
  get 'console/:id/branch' => 'console#branch', :as => :branch
  get 'console/:id/pull' => 'console#pull', :as => :repo_pull

  patch 'users/:id' => 'users#update', as: 'update_user'

  get 'console/project-count' => 'console#project-count', as: 'console_project_count'
  get 'console/project/:id/info' => 'console#project_info', as: 'project_info'
end
