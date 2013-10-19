# -*- encoding : utf-8 -*-
Blog::Application.routes.draw do

  root :to => "home#index"

  get "/admin/comments/pro" => "admin/comments#pro"


  post "/login" => "admin/user#check_site_login"
  get "/logout" => "admin/user#logout_site"
  get "/profile/my_posts" => "author#my_posts"
  get "/profile/update" => "author#profile"
  post "/profile/update" => "author#profile_update"

  namespace :admin do
    resources :post, :category, :comments
  end

  namespace :api do
    resources :post, :defaults => { :format => 'json' }
  end


  # Admin Category

  # New
  post "/admin/category/new" => "admin/category#create"

  # Edit

  get "/admin/category/edit/:id" => "admin/category#edit"
  post "/admin/category/edit/:id" => "admin/category#do_edit"

  # Delete

  get "/admin/category/delete/:id" => "admin/category#delete"

  get "/admin/user/profile" => "admin/user#profile"
  post "/admin/user/profile" => "admin/user#update_profile"


  get "admin/login" => "admin/user#login"
  post "admin/login" => "admin/user#check_user"

  post "/admin/post/create" => "admin/post#create"

  get "/admin/user/logout" => "admin/user#logout"


  get "/admin/post/edit/:id" => "admin/post#edit"
  post "/admin/post/edit/:id" => "admin/post#edit_post"


  get "/admin/post/delete/:id" => "admin/post#delete"

  match "/admin" => "admin/admin#index"



  get "/post/:id/:slug" => "post#show"

  get "/category/:id/:slug" => "categories#show"

  post "/post/comment/:id" => "post#add_comment"

  get "/add_post" => "post#add_post"
  post "/add_post" => "post#create"

  post "/search" => "post#search"
  get "/search/:tag" => "post#search_tag"


  get "/:username" => "author#show"

  resources :post

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
