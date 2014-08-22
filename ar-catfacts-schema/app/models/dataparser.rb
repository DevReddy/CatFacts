require 'csv'

class CSVParser 
	def self.parse_csv(filename)
		@array_of_emails = CSV.open(filename).readlines
	end

	def self.convert_to_array_of_hashes(array_of_emails)
		array_of_emails.map! {|emails| {:name => emails[0], :email => emails[1].strip}}
	end
end


class TextParser
	def self.parse_txt(filename)
		@array_of_facts = File.open(filename).readlines
	end

	def self.convert_to_array_of_arrays(one_long_string)
		one_long_string.map! {|string| string.delete("\n")}
		one_long_string.each_slice(1).to_a
	end



end


if __FILE__ == $0
array_of_emails = CSVParser.parse_csv('../../db/data/studentemails.csv')
p CSVParser.convert_to_array_of_hashes(array_of_emails)
cat_facts = TextParser.parse_txt('../../db/data/THEcatfacts.txt')
p TextParser.convert_to_array_of_arrays(cat_facts)
end