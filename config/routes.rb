Rails.application.routes.draw do
 root 'movies#index'

 resource :users do
   resource :comments
 end

 resource :movies do
   resource :comments
 end

end
