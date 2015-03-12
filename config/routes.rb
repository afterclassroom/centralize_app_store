Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  devise_for :users, :controllers => {:registrations => "registrations"}

  get '/users/:user_id/user_profiles/:id/edit' => 'user_profiles#edit', as: :edit_user_user_profile
  match '/users/:user_id/user_profiles/:id' => 'user_profiles#update', as: :user_user_profile, via: [:patch, :put]

  # resources :users do
  #   resources :user_profiles, :only => [:edit, :update]
  # end

  resources :developer do
    collection do
      get 'app_list', 'app_new', 'app_edit', 'app_delete', 'blog', 'document', 'authentication', 'partners', 'app_publish', 'app_unpublish'
      post 'app_create', 'app_update', 'app_update_slide', 'app_update_publish', 'app_update_unpublish'
    end
  end

  resources :lms do
    collection do
      post 'install'
    end
  end

  mount Forem::Engine, :at => "/forums"

  resources :subscribe do
    collection do
      post :create_subscribe
    end
  end

  resources :contacts do
    collection do
      post :create_contact, :create_source_code
    end
  end

  get "/delayed_job" => DelayedJobWeb, :anchor => false

  get 'api/classrooms/:id' => 'api#classrooms'
  get 'api/classrooms/:id/students' => 'api#classrooms_students'
  get 'api/classrooms/:id/parents' => 'api#classrooms_parents'
  get 'api/users/me' => 'api#users'
  get 'api/users/search' => 'api#users_search'
  get 'api/users/my_classrooms' => 'api#users_my_classrooms'
  get 'api/users/my_yearbooks' => 'api#users_my_yearbooks'

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
