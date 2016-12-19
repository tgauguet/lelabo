class CreateProvidersBaseJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		begin
			user.providers.create!([
				
				])
		rescue
			#flash[:error] = "Erreur lors de la création des ingrédients"
		end
	end

end
