require 'net/http'
require 'uri'
require 'json'
require 'sinatra'
require 'date'

get '/' do
	"#{check} - #{Time.now}"
end

get '/kill' do
	system('./kill')
end

asdfasd

get '/up' do
	system('./start')
end

def check()

	uri = URI.parse("https://8afa315b.ngrok.io/servstatus")
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