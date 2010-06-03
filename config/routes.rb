ActionController::Routing::Routes.draw do |map|
  map.resources :documents
  map.resources :spec
  map.resources :home
  map.resources :onlines
  map.resources :my_joins
  map.resources :currencies
  map.resources :albums  
  map.resources :sounds
  map.resources :ads
  map.resources :accounts
  map.resources :jobs
  map.resources :groups
  map.resources :group_joins
  map.resources :group_types  
  map.resources :sounds
  map.resources :videos
  map.resources :countries
	map.resources :tags
  map.resources :share_videos
	map.resources :video_replies
  map.resources :event_types
  map.resources :industries
  map.resources :events
  map.resources :billing_infos
  map.resources :users do |user|
  user.resources :friends
  end  
  map.resources :messages, :member => { :reply => :get, :forward => :get, :reply_all => :get, :undelete => :put }

  map.resources :user_status
  map.resources :blogs do |blog|
    blog.resources :posts do |post|
   post.resources :comments
  end
  end
  map.resources :group_chats
  map.resources :forums, :has_many => :topics
  map.resources :topics, :has_many => :replies
  map.resources :replies
  map.resources :email
  map.resources :emailer
  map.forgot    '/forgot',          :controller => 'account',:action => 'forgot'
  map.reset     'reset/:reset_code',:controller => 'account',:action => 'reset'
  map.edit "/edit", :controller=>'spec', :action=>'edit'

  map.profile 'profile/:login', :controller => 'profile', :action => 'show'

  # map.connect '', :controller => 'today'
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end
  map.root :controller => "account",:action => "signup"
  map.my_picture "/my_picture", :controller=>'albums', :action=>'my_picture'
  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
#  map.forgot    '/forgot',                    :controller => 'account',     :action => 'forgot'
#  map.reset     'reset/:reset_code',          :controller => 'account',     :action => 'reset'
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  #map.connect 'groups',:action=> 'group_join'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
