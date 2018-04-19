require 'sinatra'

get '/' do

	"Olá Ruby"

end

post '/servstatus' do

end

post '/verifica_data' do

	data_lp = Date.parse params[:data_lp]

	hoje = Date.today
	menos_60 = hoje - 60

	if data_lp >= menos_60
		{ :status => "Hoje é: " + hoje.to_s + "| 60d atrás era: " + menos_60.to_s + ", e tua data foi: " + data_lp.to_s }.to_json
	else
		{ :status => "NOT OK" }.to_json
	end

end