require_relative '../../db/config'

class Catfactreceivedbystudent < ActiveRecord::Base

	belongs_to :catfact
	belongs_to :student
end
