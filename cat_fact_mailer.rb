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
recipient = 'ghammell1@gmail.com'
cat_fact = 'Did you know... Approximately 40,000 people are bitten by cats in the U.S. annually!'

picture = ["cat", "cat2", "kitten", "kitten2", "kitten3"].sample

Mail.deliver do
       to "#{recipient}"
     from 'catfactsarethebestest@gmail.com'
  subject "Hey #{name}, here's your Cat Fact!"
     body "#{cat_fact}"
     add_file "./images/#{picture}.jpg"
end
