Rails.application.routes.draw do


  resources :subcategories
  resources :categories
  resources :categories

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end

  devise_scope :user do
    root to: 'pages#home'
  end

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all
  match "/add_project", to: "pages#add_project", via: :all
  match "/home", to: "pages#home", via: :all
  match "/show", to: "pages#show", via: :all
  match "/zero_failures", to: "pages#zero_failures", via: :all
  match "/rre", to: "pages#rre", via: :all
  match "/bip", to: "pages#bip", via: :all
  match "/contact", to: "pages#contact", via: :all
  match "/new_password", to: "pages#new_password", via: :all
  match "/forgot_password", to: "pages#forgot_password", via: :all
  match "/admin", to: "pages#admin", via: :all

  devise_for :users, :controller => {:registrations => 'registrations'}
  as :user do
  end

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'users/sign_in' => 'devise/sessions#new'
    post 'users/sign_in' => 'devise/sessions#create'
    delete 'users/sign_in' => 'devise/sessions#destroy'
  end

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  resources :projects
  resources :users

  resources :projects do
    resources :comments
  end
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
