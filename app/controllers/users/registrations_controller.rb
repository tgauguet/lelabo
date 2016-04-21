class Users::RegistrationsController < Devise::RegistrationsController
	prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  	prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy, :show]

  	def new
  		super
  	end

  	def create
  		super
  	end

  	def edit
  		super
  	end

  	def update
  		super
  	end

  	def show
  	end

	def destroy
		resource.soft_delete
		Devise.sign_out_all_scopes ? sign_out(resource_name)
		set_flash_message :notice, :destroyed if is_flashing_format?
		yield resource if block_given?
		respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
	end

	protected

	def after_sign_up_path_for(resource)
		after_sign_in_path_for(resource)
	end

end
