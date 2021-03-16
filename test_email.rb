require 'rest-client'
def send_simple_message
	RestClient.post "https://api:3b52cc07e5477927446181c14f08fe01-29561299-c64cc4df"\
    "@api.mailgun.net/v3/sandbox94f9e333ed03439184d30fea2a71f143.mailgun.org/messages",
	from: "Excited User <mailgun@sandbox94f9e333ed03439184d30fea2a71f143.mailgun.org>",
	to: "bar@example.com, YOU@sandbox94f9e333ed03439184d30fea2a71f143.mailgun.org",
	subject: "Hello",
	:text => "Testing some Mailgun awesomness!"
end

send_simple_message
