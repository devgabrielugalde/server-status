require 'net/http'
require 'uri'
require 'json'
require 'sinatra'
require 'date'

get '/' do

	loop do
		# "<p style='color: #fff; background-color: #{color}; width: 300px; text-align: center'>Server #{status} #{Time.now.strftime("%d/%m/%Y | %H:%M:%S")}</p>"
		# sleep(5)
		# return "#{check} - #{Time.now}"
		"#{Time.now}"
	end
	# "#{check} - #{Time.now}"

end

get '/kill' do
	system('./kill')
end

get '/up' do
	system('./start')
end

def check()

	uri = URI.parse("http://8afa315b.ngrok.io/servstatus")
	request = Net::HTTP::Post.new(uri)
	request.content_type = "application/json"

	response = Net::HTTP.start(uri.hostname, uri.port) do |http|
	  http.request(request)
	end

	if response.code == "200"
		"ON"
	else
		"OFF"
	end
	
end