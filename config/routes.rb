Rails.application.routes.draw do
  namespace "api" do
    get "/test", to: "default#test"

    get "/users/follower/:id", to: "users#follower"
    get "/users/following/:id", to: "users#following"
    post "/users/sub", to: "users#sub"

    resources :drivers
    resources :users
  end
end
