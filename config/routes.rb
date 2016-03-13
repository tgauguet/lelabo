Rails.application.routes.draw do
	constraints subdomain: false do
	  get ':any', to: redirect(subdomain: 'www', path: '/%{any}'), any: /.*/
	end
  	root "welcome#index"
  	resources :newsletters, :only => [:create]
end
