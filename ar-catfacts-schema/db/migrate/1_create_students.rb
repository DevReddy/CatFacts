require_relative '../config'

class CreateStudents < ActiveRecord::Migration

	def change
		create_table :students do |column|
			column.string :first_name
			column.string :email

			column.timestamps
		end
	end
end