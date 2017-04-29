class TripsController < ApplicationController
  def index
    @user = current_user
    @response = HTTParty.get('https://api.airbnb.com/v2/search_results?client_id=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&_limit=10&_offset=0&fetch_facets=true&guests=1&ib=false&ib_add_photo_flow=true&location=Lake%20Tahoe%2C%20CA%2C%20US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164')
    @response = @response["search_results"]

    eventful = HTTParty.get('http://api.eventful.com/json/events/search?location=Gainesville,fl&app_key=sZH3jKCFNTDRW7xC&image_sizes=large')
    @eventful = JSON.parse(eventful)
    @eventful = @eventful["events"]["event"]

    Skyscanner::Connection.apikey = "od357280409789380362594759932174"
    sky = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "US", :destinationPlace => "anywhere", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @sky = sky.values.first[0..4]

    paris = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "FR", :destinationPlace => "JFK", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @paris = sky.values.first[0..4]

    @paris_depart =  @paris[0]["OutboundLeg"]["DepartureDate"]

    @comments = Comment.all
  end
  def show
      @users = User.find_by(id: params[:id])
  end


  def create
    @user = current_user
    @response = HTTParty.get('https://api.airbnb.com/v2/search_results?client_id=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&_limit=10&_offset=0&fetch_facets=true&guests=1&ib=false&ib_add_photo_flow=true&location=Lake%20Tahoe%2C%20CA%2C%20US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164')
    @response = @response["search_results"]

    eventful = HTTParty.get('http://api.eventful.com/json/events/search?location=Gainesville,fl&app_key=sZH3jKCFNTDRW7xC&image_sizes=large')
    @eventful = JSON.parse(eventful)
    @eventful = @eventful["events"]["event"]

    Skyscanner::Connection.apikey = "od357280409789380362594759932174"
    sky = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "US", :destinationPlace => "anywhere", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @sky = sky.values.first[0..4]

    paris = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "FR", :destinationPlace => "JFK", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @paris = sky.values.first[0..4]

    @paris_depart =  @paris[0]["OutboundLeg"]["DepartureDate"]


    @user = current_user
    Trip.create(flights: params[:flights],
                airbnb: params[:airbnb],
                user_id: 1)
  end




end
