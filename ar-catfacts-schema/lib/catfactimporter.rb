require_relative '../app/models/catfact.rb'
require_relative '../app/models/dataparser.rb'
class CatFactImporter
	def self.import
		cat_facts = TextParser.parse_txt('db/data/THEcatfacts.txt')
		cat_facts = TextParser.convert_to_array_of_arrays(cat_facts)
		cat_facts.each do |factarray| 
			Catfact.create!(catfact: factarray.first)
		end
	end
end