require_relative '../../db/config'
require_relative '../models/dataparser'
require 'twilio-ruby'

text = TextParser.parse_txt('./app/models/student_numbers.txt')
numbers = TextParser.convert_to_array_of_arrays(text)

account_sid = ''
auth_token = ''

@client = Twilio::REST::Client.new account_sid, auth_token

#LOOP IT!
Catfact.count.times do

  rand_fact_id = rand(Catfact.count + 1)
  while rand_fact_id <= 0 || rand_fact_id > Catfact.count
    rand_fact_id = rand(Catfact.count + 1)
  end
  cat_fact = Catfact.find_by(id: rand_fact_id).catfact
  # puts Dir.pwd


  send_num = numbers.sample
  # send_num = ["12022994405"] #Sherif

  body = "Hey! Thanks for subscribing to Cat Facts! Here's your Cat Fact! Mee-WOW!\n"
  # body = "Hey Sherif! "

  puts "Sending to #{send_num}!"


  @message = @client.account.messages.create({:to => send_num,
                                     :from => "+14154668666",
                                     :body => body + cat_fact})

  # sleep(7)
end
