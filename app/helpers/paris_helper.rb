module ParisHelper

	def getSkyscannerQuotes(arrival, departure, amount)
		sky = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "FR", :destinationPlace => "JFK", :outboundPartialDate => arrival, :inboundPartialDate => departure })
		@paris = sky.values.first[0..(amount-1)]
	end

end
