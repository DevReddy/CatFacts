require_relative '../config'

class CreateCatfacts < ActiveRecord::Migration

	def change
		create_table :catfacts do |column|
			column.string :catfact 
			column.timestamps
		end
	end
end