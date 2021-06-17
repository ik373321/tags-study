Rails.application.routes.draw do
  devise_for :users
  root to:"tweets#index"
 resources :tweets do
 get :tag,:stag,on: :collection
 end

end
