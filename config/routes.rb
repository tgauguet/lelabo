Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  ################ User routes ###################
	devise_for :users, :controllers => {:confirmations => 'confirmations', :registrations => "registrations"}, path: 'utilisateur', path_names: { sign_out: 'deconnexion', password: 'mot-de-passe', confirmation: 'verification', unlock: 'debloquer', edit: "modifier" }, :except => [:update, :edit]
  # redirect user if signed_in?
  resources :users, except: [:new, :create, :index]
  devise_scope :user do
	  authenticated :user do
	    root :to => 'welcome#index', as: :authenticated_root
	  end
	  unauthenticated :user do
	    root :to => 'devise/registrations#new', as: :unauthenticated_root
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
  # customed confirmation controller routes
  devise_scope :user do
    patch "/confirm" => "confirmations#confirm"
  end
  match "/creer-votre-mot-de-passe", to: "devise/confirmations#show", :via => [:get]
  match '/nom-de-votre-compte' => 'users#first_step', via: [:get, :post]
  match "/parametres", to: "users#parameters", via: [:get, :post]
  match '/informations-de-votre-compte' => 'users#second_step', via: [:get, :post]
  match '/confirmation-de-votre-compte' => 'users#final_step', via: [:get, :post]
  match "/modifier-votre-profil" => "users#edit_profile", via: [:get, :post]
  resources :contacts, only: [:new,:create]
  resources :subscriptions, only: [:new, :create, :index]

  ################ Features routes ###################
  resources :staffs
  resources :messages, only: [:new, :create]
  resources :votes, only: [:create, :update, :destroy]
	resources :providers
	resources :feedbacks, only: [:create, :index, :destroy]
  resources :categories do
    resources :ingredients
  end
  resources :recipe_categories do
    resources :recipes
  end
	resources :to_do_lists, except: [:edit, :index] do
		resources :tasks, only: [:create, :update, :destroy] do
			member do
				patch :done
			end
		end
	end
  resources :to_do_lists, only: [:show, :new] do
		collection do
			put "/sort/:id" => "to_do_lists#sort"
			put "resort/:id" => "to_do_lists#resort"
		end
	end
	resources :ingredients do
		collection do
			get :search
		end
	end
	resources :recipes do
		resources :quantities do
			member do
				patch :set_ingredient
			end
		end
    member do
      get :preview
      get :download
      get :quant
      get :sticker
      get :stats
      get :sticker_pdf
      get :long_sticker_pdf
      get :pictures
      get :equilibrium
      get :cost
      get :quantities_pdf
      get :d_quantities_pdf
      get :quantities_array_pdf
      get :d_quantities_array_pdf
    end
	end

  #basic routes
  match '/blog', to: "blogs#index", via: [:get]
  match "/produits", to: "pages#products", :via => [:get, :post]
  match "/blog/huit-outils-pour-accelerer-votre-business" => "blogs#article", via: [:get]
  match "/blog/dix-patissiers-francais-stars-de-instagram" => "blogs#instagramstar", via: [:get]
  match "/blog/blog-dix-choses-que-personne-ne-vous-avais-dites" => "blogs#choses", via: [:get]
  match "/blog/six-bonnes-raisons-de-ne-pas-succomber-aux-produits-surgeles", to: "blogs#produits_surgeles", :via => [:get]
  match "/mentions-legales", to: "pages#mentions", via: [:get]
  match "/conditions-generales-utilisation", to: "pages#utilisation", via: [:get]
  match "/conditions-generales-vente", to: "pages#sale", via: [:get]
  match "/page-error", to: "pages#page_not_found", via: [:get]
  match "/metrics", to: "pages#metrics", via: [:get]
  get '404', :to => 'application#page_not_found'
  get '422', :to => 'application#server_error'
  get '500', :to => 'application#server_error'

  # ROUTING for help categories
  match "/aide/categories/ingredients", to: "help#ingredients", via: [:get]
  match "/partage", to: "recipes#wall", via: [:get]
  match "/aide/categories/montages", to: "help#assemblies", via: [:get]
  match "/aide/categories/paiements", to: "help#payment", via: [:get]
  match "/aide/categories/fournisseurs", to: "help#providers", via: [:get]
  match "/aide/categories/recettes", to: "help#recipes", via: [:get]
  match "/aide/categories/recherche", to: "help#search", via: [:get]
  match "/aide/categories/service-apres-vente", to: "help#service", via: [:get]
  match "/aide/categories/abonnements", to: "help#subscription", via: [:get]
  match "/aide/categories/listes-de-taches", to: "help#to_do_lists", via: [:get]

  # DO NOT REMOVE
  root "welcome#index"
end
