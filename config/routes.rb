Rails.application.routes.draw do

  get 'screening' => 'screening#index'


  get 'screening/question_1' => 'screening#question_1'
  get 'screening/question_1_sub_1' => 'screening#question_1_sub_1'
  get 'screening/question_2' => 'screening#question_2'
  get 'screening/question_2_sub_1' => 'screening#question_2_sub_1'
  get 'screening/question_2_sub_2' => 'screening#question_2_sub_2'
  get 'screening/question_3' => 'screening#question_3'
  get 'screening/question_4' => 'screening#question_4'
  get 'screening/question_5' => 'screening#question_5'
  get 'screening/question_6' => 'screening#question_6'
  get 'screening/question_7' => 'screening#question_7'
  get 'screening/question_8' => 'screening#question_8'
  get 'screening/question_9' => 'screening#question_9'
  get 'screening/question_9_sub_1' => 'screening#question_9_sub_1'
  get 'screening/question_9_sub_2' => 'screening#question_9_sub_2'
  get 'screening/question_9_sub_3' => 'screening#question_9_sub_3'
  get 'screening/question_9_sub_4' => 'screening#question_9_sub_4'


  post 'screening/question_1' => 'screening#question_1'
  post 'screening/question_1_sub_1' => 'screening#question_1_sub_1'
  post 'screening/question_2' => 'screening#question_2'
  post 'screening/question_2_sub_1' => 'screening#question_2_sub_1'
  post 'screening/question_2_sub_2' => 'screening#question_2_sub_2'
  post 'screening/question_3' => 'screening#question_3'
  post 'screening/question_4' => 'screening#question_4'
  post 'screening/question_5' => 'screening#question_5'
  post 'screening/question_6' => 'screening#question_6'
  post 'screening/question_7' => 'screening#question_7'
  post 'screening/question_8' => 'screening#question_8'
  post 'screening/question_9' => 'screening#question_9'
  post 'screening/question_9_sub_1' => 'screening#question_9_sub_1'
  post 'screening/question_9_sub_2' => 'screening#question_9_sub_2'
  post 'screening/question_9_sub_3' => 'screening#question_9_sub_3'
  post 'screening/question_9_sub_4' => 'screening#question_9_sub_4'

  get 'welcome/index'

  get 'results' => 'results#index'
  get 'results/:id' => 'results#organization'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
