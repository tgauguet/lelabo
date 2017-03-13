class CreateRecipesBaseJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		begin

				lait = user.ingredients.find_by_name("Lait entier UHT")
	      eau = user.ingredients.find_by_name("Eau")
	      creme = user.ingredients.find_by_name("Crème 35%")
	      sucre = user.ingredients.find_by_name("Sucre blanc")
	      cannelle = user.ingredients.find_by_name("Cannelle bâton")
	      anis = user.ingredients.find_by_name("Anis étoilé")
	      amer = user.ingredients.find_by_name("Chocolat Amer")
				gousse = user.ingredients.find_by_name("Vanille gousse")
			 	noisette= user.ingredients.find_by_name("Noisettes")
				amande = user.ingredients.find_by_name("Amandes blanches")
				sucreglace = user.ingredients.find_by_name("Sucre glace non amylacé")

				user.recipes.create([
					{ name:"Gianduja",category: "Confiserie",owner:"Le Labo",baking:"160",note:"",image: File.open(Rails.root.join("public", "assets", "gianduja.jpg")),quantities_attributes: {"0"=>{ ingredient_id: gousse.id, unit: "g", weight: "5", _destroy: "false"},"1"=>{ ingredient_id: noisette.id, unit: "g", weight: "250", _destroy: "false"},"2"=>{ ingredient_id: amande.id, unit: "g", weight: "250", "_destroy"=>"false"},"3"=>{ ingredient_id: sucreglace.id, unit: "g", weight: "500", _destroy: "false"}},process:"<p>Griller les amandes et les noisettes au four ventil&eacute; &agrave; 160&deg;C &agrave; la couleur blonde suivant le go&ucirc;t rechercher.</p>\r\n\r\n<p>Mixer le plus fin possible au robot coupe ou broyer finement &agrave; la broyeuse.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Conserver en seau herm&eacute;tique.</p>\r\n\r\n<p>Peu se r&eacute;aliser avec seulement&nbsp;des noisettes, ou des amandes (on perd l&rsquo;appellation Duja).</p>\r\n" },
					{ name:"Chocolat chaud à la cannelle caramélisée", stared: true, category: "Chocolat",owner:"Le Labo",baking:"100",note:"",image: File.open(Rails.root.join("public", "assets", "hot-chocolate.jpg")), quantities_attributes: {"0"=>{ ingredient_id: lait.id, unit: "g", weight: "500", _destroy: "false"},"1"=>{ ingredient_id: eau.id, unit: "g", weight: "60", _destroy: "false"},"2"=>{ ingredient_id: creme.id, unit: "g", weight: "60", "_destroy"=>"false"},"3"=>{ ingredient_id: sucre.id, unit: "g", weight: "30", _destroy: "false"},"4"=>{ ingredient_id: cannelle.id, unit: "g", weight: "1", _destroy: "false"},"5"=>{ ingredient_id: anis.id, unit: "g", weight: "1", _destroy: "false"},"6"=>{ ingredient_id: amer.id, unit: "g", weight: "115", _destroy: "false"}},process:"<p>Porter le lait, l&#39;eau et la cr&egrave;me &agrave; &eacute;bullition.</p>\r\n\r\n<p>Faire le caramel &agrave; sec avec le sucre et la cannelle.</p>\r\n\r\n<p>Verser le m&eacute;lange eau/cr&egrave;me et lait sur le caramel pour le d&eacute;cuire.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Assurez-vous que le m&eacute;lange ne d&eacute;passe pas 100&deg;C puis ajoutez le chocolat en pistoles.</p>\r\n\r\n<p>Servez bien chaud<img alt=\"\" height=\"26\" src=\"http://localhost:3000/assets/ckeditor/plugins/smiley/images/Emoji Smiley-108.png\" title=\"\" width=\"26\" />!</p>\r\n" }
				])

	      user.recipes.all.each do |recipe|
	        recipe.totals.delete_all
	        4.times { recipe.totals.create(value:  (recipe.totals.count + 1)) }
	      end

		rescue
			#flash[:error] = "Erreur lors de la création des ingrédients"
		end
	end

end
