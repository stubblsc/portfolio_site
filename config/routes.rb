MomArtSite::Application.routes.draw do
  root "home#index"

  get "/contact", to: "home#contact", as: :contact
  post "/contact", to: "home#send_message", as: :send_message
  get "/sections/:id", to: "home#sections", as: :view_sections_by_title
  get "/about", to: "home#about", as: :about
  get "/art/:id/details", to: "home#art_details", as: :art_details

  namespace :admin do
    patch "/delete_about_background", to: "admin#delete_about_background", as: :delete_about_background
    patch "/delete_home_background", to: "admin#delete_home_background", as: :delete_home_background

    get "/", to: "admin#index", as: :root

    get "/about/:id", to: "admin#show_about", as: :about
    get "/about/:id/edit", to: "admin#edit_about", as: :edit_about
    patch "/about/:id", to: "admin#update_about", as: :update_about

    get "/home/:id", to: "admin#show_home", as: :home
    get "/home/:id/edit", to: "admin#edit_home", as: :edit_home
    patch "/home/:id", to: "admin#update_home", as: :update_home

    get "/arts/select_section", to: "arts#select_section", as: :arts_select_section

    get "/arts/:section_id/section", to: "arts#view_by_section", as: :arts_view_by_section
    put "/arts/:section_id/section", to: "arts#order_by_section", as: :arts_order_by_section
    delete "/arts/section/:id", to: "arts#destroy_by_section", as: :art_by_section

    resources :arts

    put "/order_sections", to: "sections#order_sections", as: :sections_order

    resources :sections
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
