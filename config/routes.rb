Rails.application.routes.draw do
  get 'site/receiveAjax' => 'site#receiveAjax'
  
  get 'spreadsheets/receiveAjaxSpreadsheet' => 'spreadsheets#receiveAjaxSpreadsheet'

  get 'cats/new'

  post 'cats/create'

  delete 'cats/destroy'

  get 'spreadsheets/index'

  get 'spreadsheets/new'

  post 'spreadsheets/create'

  delete 'spreadsheets/destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  get 'CSV.csv', to: 'site#studentOutput', as: :download

  # You can have the root of your site routed with "root"
  #root 'movies#index'
  get 'site/index'
  get 'site/selectStudentOrFaculty'
  get 'site/facultyFilterSelection'
  get 'site/studentFilterSelection'
  get 'site/facultyOutput'
  post 'site/studentOutput'
  post 'site/saveQuery'
  get 'site/studentOutput'
  resources :spreadsheets, only: [:index, :new, :create, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'site#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  #resources :movies
  
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
