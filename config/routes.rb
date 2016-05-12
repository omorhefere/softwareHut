Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :subcategories
  resources :categories
  resources :categories
  resources :articles


  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end

  devise_scope :user do
    root to: 'projects#index'
  end

  devise_for :users

  resources :projects do
    collection do
      get 'search'
    end
  end

  resources :projects do
    get 'search', on: :collection
  end

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all
  match "/home", to: "projects#index", via: :all
  match "/zero_failures", to: "pages#zero_failures", via: :all
  match "/rre", to: "pages#rre", via: :all
  match "/bip", to: "pages#bip", via: :all
  match "/contact", to: "pages#contact", via: :all
  match "/introduction", to: "pages#introduction", via: :all
  match "/profile", to: "users#index", via: :all
  match "/projects/search", to: "projects#search", via: :all
  match "/search", to: "projects#search", via: :all
  get 'project/:id/remove_image1', to: 'projects#remove_image1', as: 'remove_project_image1'
  get 'project/:id/remove_image2', to: 'projects#remove_image2', as: 'remove_project_image2'
  get 'project/:id/remove_image3', to: 'projects#remove_image3', as: 'remove_project_image3'
  get 'project/:id/remove_image4', to: 'projects#remove_image4', as: 'remove_project_image4'



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
