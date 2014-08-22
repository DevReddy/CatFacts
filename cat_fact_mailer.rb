require 'mail'

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

name = 'Cat Facts'
email = 'catfactsarethebestest@gmail.com'
cat_fact = 'Cats are actually not dogs!'

Mail.deliver do
       to "#{email}"
     from 'catfactsarethebestest@gmail.com'
  subject "Hey #{name}, here's your Cat Fact!"
     body "#{cat_fact}"
     add_file "./cat.png"
end
