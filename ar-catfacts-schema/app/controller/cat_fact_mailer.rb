require 'mail'
require_relative '../db/config'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'catfactsarethebestest',
            :password             => 'catfacts123',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end

# AUTOMATE EVERYTHING BELOW THIS LINE

# CatFact.count.times do

rand_id = rand(Student.count + 1)
name = Student.find_by(id: rand_id).name
recipient = Student.find_by(id: rand_id).email

picture = ["cat.jpg", "cat2.jpg", "kitten.jpg", "kitten2.jpg", "kitten3.jpg", "kitten.gif"].sample
# puts Dir.pwd

Mail.deliver do
       to "#{recipient}"
     from 'catfactsarethebestest@gmail.com'
  subject "Hey #{name}, here's your Cat Fact!"
     body "#{cat_fact}"
     add_file "./db/data/images/#{picture}"
end

#sleep(10)
#end
