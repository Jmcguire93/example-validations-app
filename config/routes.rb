Rails.application.routes.draw do
  get "/users", controller: "users", action: "index"    ## Displays a list of all instances 

  get "/users/:id", controller: "users", action: "show"     ## Displays a specific instance
  
  post "/users", controller: "users", action: "create"    ## creates instances

  patch "/users/:id", controller: "users", action: "update"   ## updates instances

  delete "/users/:id", controller: "users", action: "destroy"  ##deletes a specific product/instance
end
