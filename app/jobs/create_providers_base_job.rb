class CreateProvidersBaseJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		begin
			user.providers.create!([
					{ name: "DGF", adress: "Zone industrielle des Cettons 18 Rue Panhard et Levassor", city: "Chanteloup-les-vignes", postal: "78570", country: "France", email: "", website: "http://www.dgf.fr", phone: "+33 (0) 1 39 22 22 39", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Cerf Dellier", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.cerfdellier.com", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Euro Distribution", adress: "3 rue de l'humilité", city: "Lyon", postal: "69003", country: "France", email: "", website: "http://www.eurodistribution.fr", phone: "04.37.48.05.84", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Mora", adress: "13 rue Montmartre", city: "Paris", postal: "75001", country: "France", email: "", website: "http://www.mora.fr/fr/index.asp", phone: "01 45 08 19 24 ", fax: "01 45 08 49 05", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "E. dehillerin", adress: "18 et 20 rue Coquillière", city: "Paris", postal: "75001", country: "France", email: "", website: "http://www.e-dehillerin.fr/index.php", phone: "01 42 36 53 13", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Déco Relief", adress: "5, Allée de Bonvaux", city: "Talant", postal: "21240", country: "France", email: "", website: "http://www.deco-relief.fr", phone: "03 80 56 42 38", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Matfer", adress: "9/11 rue du Tapis Vert ", city: "Les Lilas", postal: "93261", country: "France", email: "matfercontact@matfer.fr", website: "http://www.matferbourgeat.com", phone: "+ 33 (0)1 43 62 60 40", fax: "+ 33 (0)1 43 62 50 82", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Mallard Fèrriere", adress: "", city: "", postal: "", country: "France", email: "", website: "http://www.mallard-ferriere.com", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Lejeune", adress: "3 rue Bernard Palissy", city: "Asnières sur seine", postal: "92600", country: "France", email: "", website: "http://www.lejeune.tm.fr/home/index.php", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Eurolam", adress: "RUE ADRIEN LEGAY", city: "Thiers", postal: "63306", country: "France", email: "", website: "http://www.eurolam-thiers.com/fr/", phone: "04 73 53 60 64", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Meilleur du chef", adress: "", city: "", postal: "", country: "", email: "", website: "https://www.meilleurduchef.com", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Métro", adress: "", city: "", postal: "", country: "", email: "", website: "https://shop.metro.fr", phone: "0 825 09 09 09", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Ma mallette", adress: "3 rue Bernard Palissy", city: "Asnières sur seine", postal: "92600", country: "France", email: "", website: "http://www.mamallette.fr/", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Bragard", adress: "50 rue Léo Valentin", city: "Epinal", postal: "88800", country: "France", email: "serviceclients@bragard.com", website: "http://www.bragard.fr", phone: "03 29 69 10 51", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "KitchenAid", adress: "PO BOX 19BP - 2018 ANTWERP 1", city: "", postal: "", country: "Belgique", email: "", website: "https://www.kitchenaid.fr", phone: "00800 381 04026", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "VMI", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.vmi.fr", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Rondo", adress: "Heimiswilstrasse 42", city: "Burgdorf", postal: "3400", country: "Allemagne", email: "info@rondo-online.com", website: "http://www.rondo-online.com/fr/fr", phone: "+41 34 420 81 11", fax: "+41 34 420 81 99", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Bongard", adress: "", city: "Tanneries", postal: "67834", country: "", email: "bongard@bongard.fr", website: "http://www.bongard.fr", phone: "+33 3 88 78 00 23", fax: "+33 3 88 76 19 18", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Bourgeois", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.bourgeois.coop/fr/", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Hobart", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.hobart.fr", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Eurofours", adress: "577, rue Celestin Hennion", city: "Gommegnies", postal: "59144", country: "", email: "", website: "http://www.eurofours.com", phone: "+ 33 (0)3 27 28 18 18", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Koma", adress: "1 Rue du Rouge Bouton", city: "Seclin", postal: "59113", country: "France", email: "", website: "http://www.elboma-koma.com", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Panem", adress: "ZA 34 Allée des Grands Champs", city: "La Crèche", postal: "79260", country: "France", email: "panem@panem.fr", website: "http://www.panem.fr", phone: "+33 (0)5 49 25 50 04", fax: "+33 (0)5 49 05 31 64", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Cacao Barry", adress: "BP 8 Hardricourt", city: "Meulan", postal: "78250", country: "France", email: "", website: "", phone: "+33 (0)1 30 22 84 00", fax: "+33 (0)1 30 22 84 84", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Callebaut", adress: "", city: "", postal: "", country: "", email: "geraldine_montessuit@barry-callebaut.com ", website: "", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Weiss", adress: "1, rue Eugéne Weiss", city: "Saint-Etienne", postal: "42006", country: "France", email: "", website: "http://www.chocolat-weiss.fr", phone: "+ 33 4 77 49 65 23", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Michel Cluizel", adress: "Route de Conches", city: "Damville", postal: "27240", country: "France", email: "", website: "http://www.cluizel.com/fr/", phone: "02 32 35 60 00", fax: "02 32 34 83 63", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Valrhona", adress: "ZA Les Lots", city: "Tain l'Hermitage", postal: "26600", country: "France", email: "", website: "http://www.valrhonapro.com/Accueil.aspx", phone: "+ 33 (0)4 75 07 90 90", fax: "+ 33 (0)4 75 07 05 17", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Back Europe", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.backeuropfrance.fr", phone: "", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Puratos", adress: "Parc d'Affaires Silic 46 rue de Montlhéry", city: "Rungis", postal: "94543", country: "", email: "patisfrance@puratos.com", website: "http://www.puratos.fr/fr/", phone: " 01 45 60 83 83", fax: "01 45 60 40 30", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Transgourmet", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.transgourmet.fr", phone: "0 811 65 65 88", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Disgroup", adress: "", city: "", postal: "", country: "", email: "", website: "http://www.disgroup.fr", phone: "0 811 65 65 88", fax: "", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id },
					{ name: "Bridor", adress: "Lieu-dit Olivet ZA Olivet", city: "Sevron sur Vilaine", postal: "35538", country: "France", email: "commercialfrance@le-duff.com", website: "http://www.bridordefrance.com", phone: "+ 33 (0)2 99 00 11 67", fax: "+ 33 (0)2 99 00 21 26", vat: "", mobile_phone: "", siret: "", notes: "", user_id: user.id }
				])
		rescue
			#flash[:error] = "Erreur lors de la création des ingrédients"
		end
	end

end
