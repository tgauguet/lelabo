class RegistrationsController < Devise::RegistrationsController
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
		super
	end

	protected

	def after_sign_up_path_for(resource)
		after_sign_in_path_for(resource)
	end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end
