Rails.application.routes.draw do
  
  resources :floor_points
  resources :floor_maps
  resources :beacons
  get 'home/index'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  namespace :api do
    api version: 1, module: 'v1' do
      resources :sessions, only: [:create]
      resources :beacons, only: [] 
      get 'beacon_details' => 'beacons#beacon_details'
      get 'paths' => 'paths#dummy'
      get 'testing' => 'paths#dummys'
      get 'get_shortest_path' => 'checks#get_shortest_path'
      get 'initialize_floor_map' => 'checks#initialize_floor_map'
      get 'find_nearest_node' => 'paths#find_nearest_node'
    end
  end

  get 'reception/patients_near_by' => 'reception#patients_near_by', as: :patients_near_by_entrance_reception
  get 'draw_canvas' => 'floor_maps#draw_canvas'
  get 'dummy_draw' => 'floor_maps#dummy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
