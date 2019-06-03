# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                user_token POST   /user_token(.:format)                                                                    user_token#create
#               users_index GET    /users/index(.:format)                                                                   users#index
#                users_show GET    /users/show(.:format)                                                                    users#show
#              users_create POST   /users/create(.:format)                                                                  users#create
#             users_updated PUT    /users/updated(.:format)                                                                 users#updated
#             users_destroy DELETE /users/destroy(.:format)                                                                 users#destroy
#              orders_index GET    /orders/index(.:format)                                                                  orders#index
#               orders_show GET    /orders/show(.:format)                                                                   orders#show
#             orders_create POST   /orders/create(.:format)                                                                 orders#create
#            orders_updated PUT    /orders/updated(.:format)                                                                orders#updated
#            orders_destroy DELETE /orders/destroy(.:format)                                                                orders#destroy
#            products_index GET    /products/index(.:format)                                                                products#index
#             products_show GET    /products/show(.:format)                                                                 products#show
#           products_create POST   /products/create(.:format)                                                               products#create
#          products_updated PUT    /products/updated(.:format)                                                              products#updated
#          products_destroy DELETE /products/destroy(.:format)                                                              products#destroy
#                rols_index GET    /rols/index(.:format)                                                                    rols#index
#                 rols_show GET    /rols/show(.:format)                                                                     rols#show
#               rols_create POST   /rols/create(.:format)                                                                   rols#create
#              rols_updated PUT    /rols/updated(.:format)                                                                  rols#updated
#              rols_destroy DELETE /rols/destroy(.:format)                                                                  rols#destroy
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get "users/index"
  get "users/show"
  get 'users/current' => 'users#current'
  post "users/create"
  put "users/updated"
  put "users/upgrade"
  delete "users/destroy"
  
  get "orders/index"
  get "orders/show"
  post "orders/create"
  put "orders/updated"
  delete "orders/destroy"
  
  get "products/index"
  get "products/show"
  post "products/create"
  put "products/updated"
  delete "products/destroy"
  
  get "rols/index"
  get "rols/show"
  post "rols/create"
  put "rols/updated"
  delete "rols/destroy"
  
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
