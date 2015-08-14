Rails.application.routes.draw do


  

  get 'summaries/index'

  get 'summaries/new'

  get 'summaries/show'

  devise_for :users
  resources :users, only: [:update, :show, :index]
  #resources :questions
  #resources :advertisements
  #resources :show

  resources :topics do
  	resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]
    end
 end

 resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
   
end
