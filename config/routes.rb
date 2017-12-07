Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'plainlogin#login'

  # Example of regular route:
     get 'usuarios' => 'plainpage#usuarios'
     get 'usuarios/update/:id'  => 'plainpage#usuarios' 
     get 'usuarios/delete/:id'  => 'plainpage#delete'
     post 'usuarios/save' => 'plainpage#save'
     get 'login' => 'plainlogin#login'
     post 'verify' => 'user#verify'
     get 'contratos'=>'contratos#index'
     post 'contratos'=>'contratos#index'
     get 'contratos/update/:id'  => 'contratos#index' 
     get 'contratos/delete/:id'  => 'contratos#delete'
     post 'contratos/save'  => 'contratos#save'
     
     get 'area'=>'area#index'
     get 'area/update/:id'  => 'area#index' 
     get 'area/delete/:id'  => 'area#delete'
     post 'area/save'  => 'area#save' 

     get 'personas'=>'personas#index'
     get 'personas/update/:id'  => 'personas#index' 
     get 'personas/delete/:id'  => 'personas#delete'
     post 'personas/save'  => 'personas#save'
     
     get 'cuotas' => 'cuotas#index'
     get 'cuotas/update/:id' => 'cuotas#index'
     get 'cuotas/delete/:id' => 'cuotas#delete'
     post 'cuotas/save' => 'cuotas#save'

     
     get 'log'=>'log#index'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
