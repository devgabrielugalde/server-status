require 'net/http'
require 'uri'
require 'json'
require 'sinatra'
require 'date'

get '/' do

	if check == "200"
		status = "ON"
		color = "green"
	else
		status = "OFF"
		color = "red"
	end
	"<p style='color: #fff; background-color: #{color}; width: 225px; text-align: center'>Server #{status} #{Time.now.strftime("%d/%m/%Y | %H:%M:%S")}</p>"
	# loop do 
	#   if check == "200" then puts 'server is on' else puts 'server is off' end
	#   	sleep(3)
	# end

end

def check()

	uri = URI.parse("http://2ca0560f.ngrok.io/servstatus")
	request = Net::HTTP::Post.new(uri)
	request.content_type = "application/json"

	response = Net::HTTP.start(uri.hostname, uri.port) do |http|
	  http.request(request)
	end
	puts response.code

	response.code
	
end