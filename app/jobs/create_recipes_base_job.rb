class CreateRecipesBaseJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		begin
			if !user.ingredients.blank?
				lait = user.ingredients.find_by_name("Lait entier UHT")
	      eau = user.ingredients.find_by_name("Eau")
	      creme = user.ingredients.find_by_name("Crème 35%")
	      sucre = user.ingredients.find_by_name("Sucre blanc")
	      cannelle = user.ingredients.find_by_name("Cannelle bâton")
	      anis = user.ingredients.find_by_name("Anis étoilé")
	      amer = user.ingredients.find_by_name("Chocolat Amer")
				lacte = user.ingredients.find_by_name("Chocolat lacté Supérieur")
	      chocoblanc = user.ingredients.find_by_name("Chocolat blanc satin")
	      glucose = user.ingredients.find_by_name("Glucose")
	      sirop = user.ingredients.find_by_name("Sirop à 30°")
	      bdc = user.ingredients.find_by_name("Beurre de cacao")
				gousse = user.ingredients.find_by_name("Vanille gousse")
			 	noisette= user.ingredients.find_by_name("Noisettes")
				amande = user.ingredients.find_by_name("Amandes blanches")
				sucreglace = user.ingredients.find_by_name("Sucre glace non amylacé")
				whisky = user.ingredients.find_by_name("Whisky")
				beurre = user.ingredients.find_by_name("Beurre")
				sucreinverti = user.ingredients.find_by_name("Sucre inverti")
				extra = user.ingredients.find_by_name("Chocolat Extra")
				carafruit = user.ingredients.find_by_name("Fruits secs caramélisés")
				gomme = user.ingredients.find_by_name("Gomme arabique")
				alcool = user.ingredients.find_by_name("Alcool à 60°")
				amandepoudre = user.ingredients.find_by_name("Amandes poudre")
				blancs = user.ingredients.find_by_name("Blancs d'oeuf")

				user.recipes.create!([
	        { name:"Chocolat chaud à la cannelle caramélisée", stared: true, category: "Chocolat",owner:"Le Labo",baking:"100",note:"",image: File.open(Rails.root.join("public", "assets", "hot-chocolate.jpg")), quantities_attributes: {"0"=>{ ingredient_id: lait.id, weight: "500", _destroy: "false"},"1"=>{ ingredient_id: eau.id, weight: "60", _destroy: "false"},"2"=>{ ingredient_id: creme.id, weight: "60", "_destroy"=>"false"},"3"=>{ ingredient_id: sucre.id, weight: "30", _destroy: "false"},"4"=>{ ingredient_id: cannelle.id, weight: "1", _destroy: "false"},"5"=>{ ingredient_id: anis.id, weight: "1", _destroy: "false"},"6"=>{ ingredient_id: amer.id, weight: "115", _destroy: "false"}},process:"<p>Porter le lait, l&#39;eau et la cr&egrave;me &agrave; &eacute;bullition.</p>\r\n\r\n<p>Faire le caramel &agrave; sec avec le sucre et la cannelle.</p>\r\n\r\n<p>Verser le m&eacute;lange eau/cr&egrave;me et lait sur le caramel pour le d&eacute;cuire.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Assurez-vous que le m&eacute;lange ne d&eacute;passe pas 100&deg;C puis ajoutez le chocolat en pistoles.</p>\r\n\r\n<p>Servez bien chaud<img alt=\"\" height=\"26\" src=\"http://localhost:3000/assets/ckeditor/plugins/smiley/images/Emoji Smiley-108.png\" title=\"\" width=\"26\" />!</p>\r\n" },
					#{ name:"Gianduja",category: "Confiserie",owner:"Le Labo",baking:"160",note:"",image: File.open(Rails.root.join("public", "assets", "gianduja.jpg")),quantities_attributes: {"0"=>{ ingredient_id: gousse.id, weight: "5", _destroy: "false"},"1"=>{ ingredient_id: noisette.id, weight: "250", _destroy: "false"},"2"=>{ ingredient_id: amande.id, weight: "250", "_destroy"=>"false"},"3"=>{ ingredient_id: sucreglace.id, weight: "500", _destroy: "false"}},process:"<p>Griller les amandes et les noisettes au four ventil&eacute; &agrave; 160&deg;C &agrave; la couleur blonde suivant le go&ucirc;t rechercher.</p>\r\n\r\n<p>Mixer le plus fin possible au robot coupe ou broyer finement &agrave; la broyeuse.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Conserver en seau herm&eacute;tique.</p>\r\n\r\n<p>Peu se r&eacute;aliser avec seulement&nbsp;des noisettes, ou des amandes (on perd l&rsquo;appellation Duja).</p>\r\n" },
					#{ name:"Ganache truffe Whisky",category: "Chocolat", stared: true, owner:"Le Labo",baking:"",note:"",image: File.open(Rails.root.join("public", "assets", "truffe.jpg")),quantities_attributes: {"0"=>{ ingredient_id: creme.id, weight: "350", _destroy: "false"},"1"=>{ ingredient_id: sucreinverti.id, weight: "25", _destroy: "false"},"2"=>{ ingredient_id: extra.id, weight: "500", "_destroy"=>"false"},"3"=>{ ingredient_id: lacte.id, weight: "140", _destroy: "false"},"4"=>{ ingredient_id: beurre.id, weight: "40", _destroy: "false"},"5"=>{ ingredient_id: whisky.id, weight: "80", _destroy: "false"}},process:"<p>Faire bouillir la cr&egrave;me fleurette et ajouter le sucre inverti.</p>\r\n\r\n<p>Verser en deux fois sur les couvertures finement hach&eacute;es.</p>\r\n\r\n<p>Toujours travailler par le centre de fa&ccedil;on &agrave; obtenir un c&oelig;ur &eacute;lastique, (r&eacute;sultat d&rsquo;une bonne &eacute;mulsion. Celle-ci se cristallisera et se conservera mieux).&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>A 36&deg;C ajouter le beurre en pommade et le whisky.</p>\r\n\r\n<p>Laisser cristalliser et dresser &agrave; la poche douille 10 &agrave; 12 mn.</p>\r\n\r\n<p>Laisser cristalliser une nuit &agrave; 17&deg;C et fa&ccedil;onner de 2-3 cm &agrave;&nbsp;diam&egrave;tre.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Enrober d&rsquo;une couverture fondante et rouler dans le cacao poudre avec la fourchette</p>\r\n" },
					#{ name:"Fruits secs caramélisés",category: "Confiserie", stared: true, owner:"Le Labo",baking:"",note:"",image: File.open(Rails.root.join("public", "assets", "amandecara.jpg")),quantities_attributes: {"0"=>{ ingredient_id: sucre.id, weight: "330", _destroy: "false"},"1"=>{ ingredient_id: sucreinverti.id, weight: "50", _destroy: "false"},"2"=>{ ingredient_id: eau.id, weight: "180", "_destroy"=>"false"},"3"=>{ ingredient_id: gousse.id, weight: "2", _destroy: "false"}},process:"<p>Pr&eacute;parer un sirop avec l&#39;ensemble des ingr&eacute;dients.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Chauffer l&eacute;g&egrave;rement 1000g de fruits secs au four.</p>\r\n\r\n<p>Dans un po&ecirc;lon en cuivre, verser les fruits chauff&eacute;s et le sirop chaud, juste de quoi les enrober sans les coller ensembles.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Caram&eacute;liser doucement sur le gaz sans les br&ucirc;ler.</p>\r\n\r\n<p>Laisser refroidir sur marbre et s&eacute;parer si besoin.</p>\r\n\r\n<p>&nbsp;</p>\r\n" },
					#{ name:"Enrobage pour fruits",category: "Chocolat",owner:"Le Labo",baking:"",note:"",image: File.open(Rails.root.join("public", "assets", "enrobage.jpg")),quantities_attributes: {"0"=>{ ingredient_id: carafruit.id, weight: "1200", _destroy: "false"},"1"=>{ ingredient_id: lacte.id, weight: "325", _destroy: "false"},"2"=>{ ingredient_id: extra.id, weight: "1700", "_destroy"=>"false"}},process:"<p>Verser les fruits caram&eacute;lis&eacute;s dans la turbine &agrave; drag&eacute;ifier et verser en charges successives les&nbsp;couvertures m&eacute;lang&eacute;es et&nbsp;temp&eacute;r&eacute;es.</p>\r\n\r\n<p>M&eacute;langer jusqu&rsquo;&agrave; complet refroidissement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Laisser bien turbiner pour que la couverture cristallise bien et que les drag&eacute;es &eacute;vite de se coller entre elles.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Continuer a ajouter la couverture&nbsp;en petites charges successives tout en laissant bien le temps aux drag&eacute;es de se former et de se lisser.</p>\r\n\r\n<p>&nbsp;</p>\r\n" },
					#{ name:"Appareil macarons",category: "Macaron", stared: true ,owner:"Le Labo",baking:"",note:"",image: File.open(Rails.root.join("public", "assets", "macaron.jpg")),quantities_attributes: {"0"=>{ ingredient_id: sucreglace.id, weight: "700", _destroy: "false"},"1"=>{ ingredient_id: amandepoudre.id, weight: "300", _destroy: "false"},"2"=>{ ingredient_id: blancs.id, weight: "180", "_destroy"=>"false"},"3"=>{ ingredient_id: blancs.id, weight: "180", "_destroy"=>"false"},"4"=>{ ingredient_id: sucre.id, weight: "150", "_destroy"=>"false"},"2"=>{ ingredient_id: eau.id, weight: "50", "_destroy"=>"false"}},process:"<p>Faire un sirop avec l&rsquo;eau et le sucre.</p>\r\n\r\n<p>M&eacute;langer les poudres ensemble et ajouter les blanc non mont&eacute;.</p>\r\n\r\n<p>Monter les blancs et ajouter le sucre cuit.</p>\r\n\r\n<p>Verser le tout dans les poudres.</p>\r\n" },
					#{ name:"Tablette marbrée",category: "Chocolat", stared: true ,owner:"Le Labo",baking:"",note:"",image: File.open(Rails.root.join("public", "assets", "tablettemarbre.png")),quantities_attributes: {"0"=>{ ingredient_id: chocoblanc.id, weight: "200", _destroy: "false"},"1"=>{ ingredient_id: extra.id, weight: "500", _destroy: "false"}},process:"<p>Temp&eacute;rer le chocolat blanc et le chocolat noir.</p>\r\n\r\n<p>Dans un verre mesureur, verser&nbsp;la couverture noire, puis verser la couverture blanche temp&eacute;r&eacute;e le plus pr&egrave;s possible du bec verseur, sans toucher le bord et&nbsp;<strong>Sans M&eacute;langer</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Verser directement le m&eacute;lange dans un moule &agrave; tablettes &agrave; l&#39;aide du verre mesureur.</p>\r\n\r\n<p>C&#39;est pr&ecirc;t !&nbsp;<img alt=\"\" height=\"26\" src=\"http://localhost:3000/assets/ckeditor/plugins/smiley/images/Emoji Objects-210.png\" title=\"\" width=\"26\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n" },
					#{ name:"Glaçage gomme arabique",category: "Confiserie",owner:"Le Labo",baking:"",note:"",image: File.open(Rails.root.join("public", "assets", "gommearabique.jpg")),quantities_attributes: {"0"=>{ ingredient_id: eau.id, weight: "200", _destroy: "false"},"1"=>{ ingredient_id: gomme.id, weight: "100", _destroy: "false"},"2"=>{ ingredient_id: alcool.id, weight: "300", "_destroy"=>"false"}},process:"<p>Faire bouillir l&rsquo;eau et verser la sur la poudre de gomme arabique laisser refroidir et ajouter l&rsquo;alcool &agrave; 60&deg;.</p>\r\n" },
	        #{ name:"Chocolat plastique ivoire",category: "Chocolat",owner:"Le Labo",baking:"",note:"Même recette pour le chocolat plastique lait. Pour le chocolat plastique noir, enlever la masse de beurre de cacao.",image: File.open(Rails.root.join("public", "assets", "chocolat-blanc.jpg")),quantities_attributes: {"0"=>{ ingredient_id: chocoblanc.id, weight: "1000", _destroy: "false"},"1"=>{ ingredient_id: glucose.id, weight: "300", _destroy: "false"},"2"=>{ ingredient_id: sirop.id, weight: "150", "_destroy"=>"false"},"3"=>{ ingredient_id: bdc.id, weight: "150", _destroy: "false"}},process:"<p>Faire chauffer le sirop et le verser dans le glucose, puis dans la couverture fondue. M&eacute;langer.</p>\r\n\r\n<p>Laisser 1h &agrave; +4&deg;C.</p>\r\n\r\n<p>M&eacute;langer &agrave; nouveau et laisser reposer 2h &agrave; +4&deg;C.</p>\r\n\r\n<p>M&eacute;langer au batteur avant de vous servir.</p>\r\n" }
					])

	      user.recipes.all.each do |recipe|
	        recipe.totals.delete_all
	        4.times { recipe.totals.create(value:  (recipe.totals.count + 1)) }
	      end

				fruitscaramelise = user.recipes.find_by_name("Fruits secs caramélisés")
				enrobagefruits = user.recipes.find_by_name("Enrobage pour fruits")
				glacagegomme = user.recipes.find_by_name("Glaçage gomme arabique")

				user.assemblies.create!([
					{ title:"Noisettes enrobées", category: "Confiserie", owner:"Le Labo",image: File.open(Rails.root.join("public", "assets", "noisette.jpg")), "recipe_items_attributes"=>{"0"=>{recipe_id: fruitscaramelise.id, "_destroy"=>"false"}, "1"=>{recipe_id: enrobagefruits.id, "_destroy"=>"false"}, "2"=>{recipe_id: glacagegomme.id, "_destroy"=>"false"}}},
					{ title:"Amandes enrobées", category: "Confiserie", owner:"Le Labo",image: File.open(Rails.root.join("public", "assets", "amandes.jpg")), "recipe_items_attributes"=>{"0"=>{recipe_id: fruitscaramelise.id, "_destroy"=>"false"}, "1"=>{recipe_id: enrobagefruits.id, "_destroy"=>"false"}, "2"=>{recipe_id: glacagegomme.id, "_destroy"=>"false"}}}
					])
			end
		rescue
			#flash[:error] = "Erreur lors de la création des ingrédients"
		end
	end

end
