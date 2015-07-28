Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'comments/_form'

  get 'summaries/index'

  get 'summaries/new'

  get 'summaries/show'

  devise_for :users
  resources :users, only: [:update]
  resources :questions
  resources :advertisements

  resources :topics do
  	resources :posts, except: [:index], only: [:comments]
 end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
   
end
