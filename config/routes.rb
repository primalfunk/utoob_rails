Rails.application.routes.draw do
 root 'movie#index'

 resource :users do
   resource :comments
 end

 resource :movies do
   resource :comments
 end

end
