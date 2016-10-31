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
			user.recipes.create!([
        { name:"Chocolat chaud à la cannelle caramélisée",category: "Chocolat",owner:"Le Labo",baking:"100",note:"",image: File.open("#{Rails.root}/app/assets/images/base-recipe-img/cannelle.jpg"),quantities_attributes: {"0"=>{ ingredient_id: lait.id, weight: "500", _destroy: "false"},"1"=>{ ingredient_id: eau.id, weight: "60", _destroy: "false"},"2"=>{ ingredient_id: creme.id, weight: "60", "_destroy"=>"false"},"3"=>{ ingredient_id: sucre.id, weight: "30", _destroy: "false"},"4"=>{ ingredient_id: cannelle.id, weight: "1", _destroy: "false"},"5"=>{ ingredient_id: anis.id, weight: "1", _destroy: "false"},"6"=>{ ingredient_id: amer.id, weight: "115", _destroy: "false"}},process:"<p>Porter le lait, l&#39;eau et la cr&egrave;me &agrave; &eacute;bullition.</p>\r\n\r\n<p>Faire le caramel &agrave; sec avec le sucre et la cannelle.</p>\r\n\r\n<p>Verser le m&eacute;lange eau/cr&egrave;me et lait sur le caramel pour le d&eacute;cuire.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Assurez-vous que le m&eacute;lange ne d&eacute;passe pas 100&deg;C puis ajoutez le chocolat en pistoles.</p>\r\n\r\n<p>Servez bien chaud<img alt=\"\" height=\"26\" src=\"http://localhost:3000/assets/ckeditor/plugins/smiley/images/Emoji Smiley-108.png\" title=\"\" width=\"26\" />!</p>\r\n" }
				])
		rescue
			#flash[:error] = "Erreur lors de la création des ingrédients"
		end
	end

end
