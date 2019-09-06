class Driver < ApplicationRecord
end

Prefix Verb     URI Pattern                         Controller#Action
api_drivers     GET    /api/drivers(.:format)       api/drivers#index
                POST   /api/drivers(.:format)       api/drivers#create
api_driver      GET    /api/drivers/:id(.:format)   api/drivers#show
                PATCH  /api/drivers/:id(.:format)   api/drivers#update
                PUT    /api/drivers/:id(.:format)   api/drivers#update
                DELETE /api/drivers/:id(.:format)   api/drivers#destroy
