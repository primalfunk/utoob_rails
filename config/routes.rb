Rails.application.routes.draw do
 root 'movies#index'

 resources :users do
   resources :comments
 end

 resources :movies do
   resources :comments
 end
end
