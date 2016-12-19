require 'open-uri'
require 'nokogiri'

ingredient = "Chocolat noir"

url = "http://www.monmenu.fr/s/rechercher-un-aliment-pid142?target=%252Fs%252Fchercher-un-aliment-pid142&search=#{ingredient}"
page = Nokogiri::HTML(open(url))

proteines = page.css('.small-visible').first.parent.text.gsub("gr proteines", "")
glucides = page.search('.small-visible')[1].parent.text.gsub("gr glucides", "")
lipides = page.search('.small-visible')[2].parent.text.gsub("gr lipides", "")
calories = page.css('.sortedColumn').first.next_element.text.gsub(" calories (Kcal)", "")
ig = page.css('.sortedColumn').first.next_element.next_element.text.gsub("\n", "")

npglci = "name: '#{ingredient}',  protein: '#{proteines}', carbohydrates: '#{glucides}', fat_percent: '#{lipides}', kcal: '#{calories}', ig: '#{ig}'"

puts npglci

#TO BE DONE
#{}"{ price: '' , unit: '', category: '', sugar_power: '', alcool_percent: '', cocoa_butter_percent: '',salt: '', ig: '', water_percent: '', sugar_percent: '', dry_matter_percent: '', cocoa_percent: '', cocoa_total_percent: '', provider_id: '' }"
