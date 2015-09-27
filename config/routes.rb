Rails.application.routes.draw do
  constraints DomainConstraint do
    comfy_route :cms_admin, :path => '/admin'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'browse' => 'browse#index'

  get 'signup' => 'auth#signup'
  get 'login' => 'auth#login'

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

  namespace :internal do
    # Directs /internal/admin/* to Internal::AdminController
    # (app/controllers/internal/admin_controller.rb)
    resources :admin
  end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # Make sure this routeset is defined last
  # constraints DomainConstraint do
    # comfy_route :cms, :path => '/', :sitemap => false
  # end

  resources :contents

  root 'home#index'

end
