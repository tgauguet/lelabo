class CreateBaseRecipeIngredientsJob < ActiveJob::Base
	queue_as :default

	def perform(user)
		begin
			user.ingredients.create!([
            { name: "Sorbitol",price:"15" , unit: "Kg", category: "Sucres", sugar_power: "50", alcool_percent: "", cocoa_butter_percent: "",
            fat_percent: "", water_percent: "2", sugar_percent: "50", kcal: "240", dry_matter_percent: "98", cocoa_percent: "", cocoa_total_percent: "", provider_id: "" },
            { name: "Chocolat Amer",price:"9.8" , unit: "Kg", category: "Chocolats", sugar_power: "34.4", alcool_percent: "", cocoa_butter_percent: "40.3",
            fat_percent: "", water_percent: "", sugar_percent: "34.4", kcal: "432", dry_matter_percent: "100", cocoa_percent: "24.4", cocoa_total_percent: "64.7", provider_id: "" },
            { name: "Chocolat Extra",price:"10.2" , unit: "Kg", category: "Chocolats", sugar_power: "34.4", alcool_percent: "", cocoa_butter_percent: "40.3",
            fat_percent: "", water_percent: "", sugar_percent: "34.4", kcal: "512", dry_matter_percent: "100", cocoa_percent: "24.4", cocoa_total_percent: "64.7", provider_id: "" },
            { name: "Chocolat lacté Supérieur",price:"11.40" , unit: "Kg", category: "Chocolats", sugar_power: "37.3", alcool_percent: "", cocoa_butter_percent: "32",
            fat_percent: "", water_percent: "", sugar_percent: "37.3", kcal: "456", dry_matter_percent: "100", cocoa_percent: "6.1", cocoa_total_percent: "38.1", provider_id: "" },
            { name: "Fruits secs caramélisés",price:"9.8" , unit: "Kg", category: "Fruits secs", sugar_power: "30", alcool_percent: "", cocoa_butter_percent: "",
            fat_percent: "", water_percent: "", sugar_percent: "30", kcal: "", dry_matter_percent: "100", cocoa_percent: "", cocoa_total_percent: "", provider_id: "" },
            { name: "Alcool à 60°",price:"9.14" , unit: "Litre", category: "Alcools", sugar_power: "", alcool_percent: "60", cocoa_butter_percent: "",
            fat_percent: "", water_percent: "40", sugar_percent: "", kcal: "180", dry_matter_percent: "", cocoa_percent: "", cocoa_total_percent: "", provider_id: "" }
            ])
    rescue
      #flash[:error] = "Erreur lors de la création des ingrédients"
    end
  end
end
