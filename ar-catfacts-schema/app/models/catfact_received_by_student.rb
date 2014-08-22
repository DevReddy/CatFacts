require_relative '../../db/config'

class CatfactReceivedByStudent < ActiveRecord::Base

	belongs_to :catfact 
	belongs_to :student
end