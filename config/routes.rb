Rails.application.routes.draw do
  namespace "api" do
    resources :drivers
  end
end
