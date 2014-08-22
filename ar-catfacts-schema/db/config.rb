require 'active_record'
require_relative '../app/models/catfact'
require_relative '../app/models/student'
require_relative '../app/models/catfactreceivedbystudent'


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/catfacts.sqlite3")
