require 'mail'
require_relative '../../db/config'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'your.host.name',
            :user_name            => 'catfactsarethebestest',
            :password             => '',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end

# AUTOMATE EVERYTHING BELOW THIS LINE

Catfact.count.times do
  rand_stud_id = rand(Student.count + 1)
  while rand_stud_id <= 0 || rand_stud_id > Student.count
    rand_stud_id = rand(Student.count + 1)
  end

  name = Student.find_by(id: rand_stud_id).first_name       #Get random student
  recipient = Student.find_by(id: rand_stud_id).email

  rand_fact_id = rand(Catfact.count + 1)
  while rand_fact_id <= 0 || rand_fact_id > Catfact.count
    rand_fact_id = rand(Catfact.count + 1)
  end
  cat_fact = Catfact.find_by(id: rand_fact_id).catfact #Get random fact

  picture = ["cat.jpg", "cat2.jpg", "kitten.jpg", "kitten2.jpg", "kitten3.jpg", "kitten.gif"].sample
  # puts Dir.pwd


  if Catfactreceivedbystudent.find_by(catfact_id:rand_fact_id, student_id:rand_stud_id) == nil

    Student.find_by(id:rand_stud_id).catfactreceivedbystudents.create(catfact_id:rand_fact_id, student_id:rand_stud_id) # Create link btwn fact and student

    puts "Sending fact #{rand_fact_id} to #{name} (#{recipient})!"

    Mail.deliver do
           to "#{recipient}"
         from 'catfactsarethebestest@gmail.com'
      subject "Hey #{name}, here's your Cat Fact!"
         body "#{cat_fact}"
         add_file "./db/data/images/#{picture}"
    end
    # Muledeers, mule.deer.2014@devbootcamp.com

    puts "Sent!"

  end

  # sleep(7)
end
