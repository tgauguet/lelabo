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
	resource :user, only: [:edit] do
		collection do
			patch :set_names
			patch :second_step
			patch :confirm_informations
		end
	end
	resources :users
	devise_scope :user do
      put "/confirm" => "confirmations#confirm"
      patch "/confirm" => "confirmations#confirm"
    end
    match '/nom-de-votre-compte' => 'users#first_step', via: [:get, :post, :patch, :put]
    match '/informations-de-votre-compte' => 'users#second_step', via: [:get, :post]
    match '/confirmation-de-votre-compte' => 'users#final_step', via: [:get, :post]
  	root "welcome#index"
  	resources :newsletters, :only => [:create]
end