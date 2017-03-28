class CreateTodosBaseJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		begin

				user.to_do_lists.create([
					{title: "Lundi"},
					{title: "Mardi"},
					{title: "Mercredi"}
				])

	      user.to_do_lists.first.tasks.create([
					{name: "Appareil petits fours"},
					{name: "Appareil à madeleines"},
					{name: "Ganache poivre long"},
					{name: "Décors petits gâteaux"},
					{name: "Pâte à choux (éclairs + religieuses)"},
					{name: "Garnir et glaçer les éclairs"},
					{name: "Tourage feuilletage"},
					{name: "Opéras"}
				])

				user.to_do_lists.second.tasks.create([
					{name: "Grand nettoyage du labo"}
				])

				user.to_do_lists.third.tasks.create([
					{name: "Moulage demi-sphères pour montages de Pâques"},
					{name: "Fabrication pâte d'amande"},
					{name: "Façonnage éléments en pâte d'amande pour les montages"},
					{name: "Appareil glaçage ivoire"},
					{name: "Glaçage entremets abricot"},
					{name: "Fond de tartes + cuisson"},
					{name: "Préparation des choux pour pièces montées"}
				])

		rescue
			#flash[:error] = "Erreur lors de la création des ingrédients"
		end
	end

end
