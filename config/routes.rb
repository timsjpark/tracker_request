Rails.application.routes.draw do
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
  match 'console/repo-count', :to => 'console#repo-count', :via => :get
  get 'console/:id/info' => 'console#info', :as => :repo_info
  match 'console/:id/branch', :to => 'console#branch', :as => :branch, :via => :get
  get 'console/:id/pull' => 'console#pull', :as => :repo_pull

  patch 'users/:id' => 'users#update', as: 'update_user'

  get 'console/project-count' => 'console#project-count', as: 'console_project_count'
  get 'console/:id/projectinfo' => 'console#projectinfo', as: 'project_info'
  get 'console/:id/story' => 'console#story', as: 'story'

  get 'report_bug' => 'bugs#report_bug', as: 'report_bug'
end
