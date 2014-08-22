require_relative '../../db/config'

class Catfact < ActiveRecord::Base

	has_many :catfactreceivedbystudents
	has_many :students, :through => :catfactreceivedbystudents

end
