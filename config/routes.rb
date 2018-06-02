Rails.application.routes.draw do
  get 'uploads/show'
  get 'uploads/new'
 root 'movies#index'
 devise_for :users


 resources :movies do
   resources :comments
 end
get 'like/:id', to: 'movies#like', as: 'movie_like'
get 'dislike/:id', to: 'movies#dislike', as: 'movie_dislike'

end
