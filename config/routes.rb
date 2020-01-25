Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/v1", to: "graphql#execute"
  get "/v1", to: "graphql#execute"
end
