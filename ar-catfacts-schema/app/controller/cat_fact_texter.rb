require_relative '../../db/config'
require_relative '../models/dataparser'
require 'twilio-ruby'


rand_fact_id = rand(Catfact.count)
cat_fact = Catfact.find_by(id: rand_fact_id).catfact
puts Dir.pwd
text = TextParser.parse_txt('./app/models/student_numbers.txt')
numbers = TextParser.convert_to_array_of_arrays(text)

account_sid = 'AC90434a67ef1e41b8c69308b4d0ae7098'
auth_token = '1242572856dbaca3a0faf7418f8cd902'

@client = Twilio::REST::Client.new account_sid, auth_token

@message = @client.account.messages.create({:to => numbers.sample,
                                   :from => "+14154668666",
                                   :body => "Hey! Thanks for subscribing to Cat Facts! Here's your Cat Fact! Mee-WOW!\n" + cat_fact})
