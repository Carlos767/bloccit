Rails.application.routes.draw do

  get 'summaries/index'

  get 'summaries/new'

  get 'summaries/show'

  devise_for :users
resources :questions

resources :advertisements

 resources :topics do
 	resources :posts, except: [:index]
 end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
   
end
