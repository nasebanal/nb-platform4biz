Rails.application.routes.draw do


  #======= Home =======

  root 'home#index'
  get 'home/index'
  get 'dashboard/index', :as => :dashboard
	get 'timeseries/index'
  get 'comparison/index'


  #======= Callback =======

# get '/auth/:provider/callback', :to => 'sessions#callback'
# post '/auth/:provider/callback', :to => 'sessions#callback'
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/quickbooks', :as => :login_qb
  get '/logout' => 'sessions#destroy', :as => :logout


	#======= Ranking =======

  get 'search/index'
  get 'ranking/index'


	#======= Members	=======

	get 'members/index', :as => :members

	resources :users do
    resources :organizations
    resources :roles
    resources :events
  end


	#======= Events	=======

	resources :events


	#======= Financial Data =======

  resources :statements
  resources :ledger_accounts
  resources :accounts
  resources :ledgers
	resources :account_types do
		resources :accounts
	end


	#======= Settings	=======

  resources :assignments
  resources :roles
  resources :organizations
	resources :calendars

  #======= Other Master Maintenance =======

  resources :user_types
  resources :statuses
	resources :ledger_types
  resources :statement_types


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
