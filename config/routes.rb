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
  get 'console/testing' => 'console#testing'
  get 'console/repo-count' => 'console#repo-count'
  get 'console/:id/info' => 'console#info', :as => :repo_info
  get 'console/:id/branch' => 'console#branch', :as => :branch
  get 'console/:id/pull' => 'console#pull', :as => :repo_pull

  patch 'users/:id' => 'users#update', as: 'update_user'

  get 'console/project-count' => 'console#project-count', as: 'console_project_count'
  get 'console/:id/projectinfo' => 'console#projectinfo', as: 'project_info'
  get 'console/:id/story' => 'console#story', as: 'story'

  get 'report_bug' => 'bugs#report_bug', as: 'report_bug'
end
