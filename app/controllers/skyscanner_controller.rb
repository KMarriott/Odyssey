class SkyscannerController < ApplicationController




	def index

	def getSkyscannerQuotes(arrival, departure, amount)
		sky = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "FR", :destinationPlace => "JFK", :outboundPartialDate => arrival, :inboundPartialDate => departure })
		@sky = sky.values.first[0..(amount-1)]
	end
		getSkyscannerQuotes(params[:arrival], params[:departure], 5)
		render json: @sky
	end

	def show
	end

end
