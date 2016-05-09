Rails.application.routes.draw do
	devise_for :users, :controllers => {:confirmations => 'confirmations', :registrations => "registrations"}, path: 'utilisateur', path_names: { sign_out: 'deconnexion', password: 'mot-de-passe', confirmation: 'verification', unlock: 'debloquer', edit: "modifier" }, :except => [:update, :edit]
  	devise_scope :user do
	  authenticated :user do
	    root :to => 'welcome#index', as: :authenticated_root
	  end
	  unauthenticated :user do
	    root :to => 'devise/registrations#new', as: :unauthenticated_root
	  end
	end
	resources :feedbacks, only: [:create, :index, :destroy]
	resources :to_do_lists do
		resources :tasks do
			member do
				patch :done
			end
		end
	end
	resource :user, only: [:edit] do
		collection do
			patch :set_names
			patch :second_step
			patch :confirm_informations
			patch :set_user_informations
			patch :set_parameters
		end
	end
	resources :subscriptions, only: [:new, :create, :index, :update, :edit]
	resources :users
	resources :contacts, only: [:new,:create]
	devise_scope :user do
      put "/confirm" => "confirmations#confirm"
      patch "/confirm" => "confirmations#confirm"
    end
    match '/blog', to: "blogs#index", via: [:get]
    match "/creer-votre-mot-de-passe", to: "devise/confirmations#show", :via => [:get]
    match "/produits", to: "pages#products", :via => [:get, :post]
    match '/nom-de-votre-compte' => 'users#first_step', via: [:get, :post]
    match "/parametres", to: "users#parameters", via: [:get, :post]
    match "/aide", to: "pages#help", via: [:get]
    match '/informations-de-votre-compte' => 'users#second_step', via: [:get, :post]
    match '/confirmation-de-votre-compte' => 'users#final_step', via: [:get, :post]
    match "/modifier-votre-profil" => "users#edit_profile", via: [:get, :post]
    match "/blog/huit-outils-pour-accelerer-votre-business" => "blogs#article", via: [:get]
    match "/blog/six-bonnes-raisons-de-ne-pas-succomber-aux-produits-surgeles", to: "blogs#produits_surgeles", :via => [:get]
  	root "welcome#index"
  	resources :newsletters, :only => [:create]
end