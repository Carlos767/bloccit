# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

Rails.application.routes.draw do
  resources :homes, only: [:show]
  root to: "homes#show"
end