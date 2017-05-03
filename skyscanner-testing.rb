require 'httparty'
require 'skyscanner'

apiKey = "od357280409789380362594759932174"

url = "http://partners.api.skyscanner.net/apiservices/reference/v1.0/currencies?"
request = url + "apiKey=#{apiKey}"


#List of Locales
# url = "http://partners.api.skyscanner.net/apiservices/reference/v1.0/locales?"
# response = HTTParty.get( url + "apiKey=#{apiKey}")
# response["Locales"].each do |x|
# 	p x["Code"]
# end


# #List of Currencies
# url = "http://partners.api.skyscanner.net/apiservices/reference/v1.0/currencies?"
# response = HTTParty.get( url + "apiKey=#{apiKey}")
# response["Currencies"].each do |x|
# 	p x["Code"]
# end


#List of Countries
#Using en-US as locale
# url = "http://partners.api.skyscanner.net/apiservices/reference/v1.0/countries/en-US/?"
# response = HTTParty.get( url + "apiKey=#{apiKey}")
# response["Countries"].each do |x|
# 	p x["Code"]
# end


# request = url + /browsequotes/v1.0/USA/USD/en-US/Bamiyan/France/anytime/anytime

#We can adjust showing price with API

# p HTTParty.get("http://partners.api.skyscanner.net/apiservices/geo/v1.0?apiKey=od357280409789380362594759932174")

# response = HTTParty.get('http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/US/USD/en-US/UK/anywhere/anytime/anytime?apiKey=od357280409789380362594759932174')

# p response["Quotes"][0]
# puts " "
# p response["Quotes"][1]



#Getting quotes
Skyscanner::Connection.apikey = apiKey

p Skyscanner::Connection.browse_quotes({ :country => "GB", :currency => "GBP", :locale => "en-GB", :originPlace => "UK", :destinationPlace => "anywhere", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
