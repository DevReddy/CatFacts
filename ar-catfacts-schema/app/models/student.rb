require_relative '../../db/config'

class Student < ActiveRecord::Base

	validates_format_of :email, with: /\w+@\w+\.[a-z]{2,}/
	validates :email, :uniqueness => true

	has_many :catfactreceivedbystudents
	has_many :catfacts, :through => :catfactrecievedbystudents

end
