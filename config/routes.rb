Rails.application.routes.draw do

  get 'summaries/index'

  get 'summaries/new'

  get 'summaries/show'

  devise_for :users
  resources :users, only: [:update]
  resources :questions
  resources :advertisements

  resources :topics do
  	resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
 end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
   
end
