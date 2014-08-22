require 'rspec'
require_relative '../app/models/student'
require_relative '../db/config'


describe Student, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:students).should be_true
    Student.delete_all
  end


  before(:each) do
    @student = Student.new
    @student.assign_attributes(
      :first_name => "Kreay",
      :email => 'kreayshawn@oaklandhiphop.net'
    )
  end

  it "should accept valid info" do
    @student.should be_valid
  end

  it "shouldn't accept invalid emails" do
    ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
      @student.assign_attributes(:email => address)
      @student.should_not be_valid
    end
  end

  it "should accept valid emails" do
    ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
      @student.assign_attributes(:email => address)
      @student.should be_valid
    end
  end

  it "shouldn't allow two students with the same email" do
    another_student = Student.create!(
      :email => @student.email
    )
    @student.should_not be_valid
  end
end