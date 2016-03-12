Rails.application.routes.draw do
  root "welcome#index"
  resources :newsletters, :only => [:create]
end
