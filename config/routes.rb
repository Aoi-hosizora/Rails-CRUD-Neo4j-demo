Rails.application.routes.draw do
  namespace "api" do
    resources :drivers
    resources :users
  end
end
