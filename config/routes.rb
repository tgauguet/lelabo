Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	devise_for :users, :controllers => {:confirmations => 'confirmations', :registrations => "registrations"}, path: 'utilisateur', path_names: { sign_out: 'deconnexion', password: 'mot-de-passe', confirmation: 'verification', unlock: 'debloquer', edit: "modifier" }, :except => [:update, :edit]
  # redirect user if signed_in?
  devise_scope :user do
	  authenticated :user do
	    root :to => 'welcome#index', as: :authenticated_root
	  end
	  unauthenticated :user do
	    root :to => 'devise/registrations#new', as: :unauthenticated_root
	  end
	end
	resources :providers
	resources :feedbacks, only: [:create, :index, :destroy]
	### Note on "member do" and "collection do"
	### member acts like a member, it requires an ID
	### while collection don't require any ID
	# add tasks path to to_do_lists
	resources :to_do_lists, except: [:edit, :index] do
		resources :tasks, only: [:create, :update, :destroy] do
			member do
				patch :done
			end
		end
	end
  resources :categories, only: [:new, :create, :destroy]
	resources :recipes do
		resources :quantities do
			member do
				patch :set_ingredient
			end
		end
    member do
      get :download
      get :quantities_pdf
      get :d_quantities_pdf
    end
	end
	resources :assemblies do
	  member do
      get :download
    end
	end
	# create routes for each registration steps
	resource :user, only: [:edit] do
		collection do
			patch :set_names
			patch :second_step
			patch :confirm_informations
			patch :set_user_informations
			patch :set_parameters
		end
	end
	resources :subscriptions, only: [:new, :create, :index]
	resources :users, except: [:new, :create, :index]
	#create route for jquery sortable
	resources :to_do_lists, only: [:show, :new] do
		collection do
			put "/sort/:id" => "to_do_lists#sort"
			put "resort/:id" => "to_do_lists#resort"
		end
	end
	resources :ingredients, except: [:show, :index] do
		collection do
			#put "/sort/:id" => "ingredients#sort" -> unused since jquery sortable has been removed
			get :search
		end
	end
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
  match '/informations-de-votre-compte' => 'users#second_step', via: [:get, :post]
  match '/confirmation-de-votre-compte' => 'users#final_step', via: [:get, :post]
  match "/modifier-votre-profil" => "users#edit_profile", via: [:get, :post]
  match "/blog/huit-outils-pour-accelerer-votre-business" => "blogs#article", via: [:get]
  match "/blog/dix-patissiers-francais-stars-de-instagram" => "blogs#instagramstar", via: [:get]
  match "/blog/six-bonnes-raisons-de-ne-pas-succomber-aux-produits-surgeles", to: "blogs#produits_surgeles", :via => [:get]
  match "/mentions-legales", to: "pages#mentions", via: [:get]
  match "/conditions-generales-utilisation", to: "pages#utilisation", via: [:get]
  match "/conditions-generales-vente", to: "pages#sale", via: [:get]
  match "/page-error", to: "pages#page_not_found", via: [:get]
  match "/metrics", to: "pages#metrics", via: [:get]
  resources :newsletters, :only => [:create]
  get '404', :to => 'application#page_not_found'
  get '422', :to => 'application#server_error'
  get '500', :to => 'application#server_error'
  ###begining of help pages routing
  # ROUTING for help categories
  match "/aide/categories/ingredients", to: "help#ingredients", via: [:get]
  match "/aide/categories/montages", to: "help#assemblies", via: [:get]
  match "/aide/categories/paiements", to: "help#payment", via: [:get]
  match "/aide/categories/fournisseurs", to: "help#providers", via: [:get]
  match "/aide/categories/recettes", to: "help#recipes", via: [:get]
  match "/aide/categories/recherche", to: "help#search", via: [:get]
  match "/aide/categories/service-apres-vente", to: "help#service", via: [:get]
  match "/aide/categories/abonnements", to: "help#subscription", via: [:get]
  match "/aide/categories/listes-de-taches", to: "help#to_do_lists", via: [:get]
  ###end of help pages routing
  root "welcome#index"
end
