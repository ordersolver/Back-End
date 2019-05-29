# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#               users_index GET    /users/index(.:format)                                                                   users#index
#                users_show GET    /users/show(.:format)                                                                    users#show
#              users_create POST   /users/create(.:format)                                                                  users#create
#              users_update PUT    /users/update(.:format)                                                                  users#update
#             users_destroy DELETE /users/destroy(.:format)                                                                 users#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  post "users/create"
  put "users/update"
  delete "users/destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
