require_relative '../app/models/student'
require_relative '../app/models/dataparser'

class StudentImporter < ActiveRecord::Base
	def self.import
		array_of_emails = CSVParser.parse_csv('db/data/studentemails.csv')
		array_of_email_hashes = CSVParser.convert_to_array_of_hashes(array_of_emails)
		array_of_email_hashes.each do |hash| 
			Student.create!(hash)
		end
	end
end

