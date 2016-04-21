Rails.application.routes.draw do
	devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }, path: 'utilisateur', path_names: { sign_out: 'deconnexion', password: 'mot-de-passe', confirmation: 'verification', unlock: 'debloquer', edit: "modifier" }, :except => [:update, :edit]
  	devise_scope :user do
	  authenticated :user do
	    root :to => 'welcome#index', as: :authenticated_root
	  end
	  unauthenticated :user do
	    root :to => 'devise/registrations#new', as: :unauthenticated_root
	  end
	end
  	root "welcome#index"
  	resources :newsletters, :only => [:create]
end
