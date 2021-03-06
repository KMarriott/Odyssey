class ParisController < ApplicationController
  def index
    @user = current_user
    @response = HTTParty.get('https://api.airbnb.com/v2/search_results?client_id=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&_limit=10&_offset=0&fetch_facets=true&guests=1&ib=false&ib_add_photo_flow=true&location=Paris%2C%20FR%2C%20US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164')
    @response = @response["search_results"]


    eventful = HTTParty.get('http://api.eventful.com/json/events/search?location=paris,fr&app_key=sZH3jKCFNTDRW7xC&image_sizes=large')
    @eventful = JSON.parse(eventful)
    @eventful = @eventful["events"]["event"][0]


  


    Skyscanner::Connection.apikey = "od357280409789380362594759932174"
    sky = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "US", :destinationPlace => "anywhere", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @sky = sky.values.first[0..0]

    paris = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "FR", :destinationPlace => "JFK", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @paris = sky.values.first[0..0]

    @paris_depart =  @paris[0]["OutboundLeg"]["DepartureDate"][0..9]

    @comments = Comment.all
    @place = "paris"
  end
  def show
    @paris = Pari.find_by(id: params[:id])
      @users = User.find_by(id: params[:id])

      @userupdate = Trip.new


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
    @sky = sky.values.first[0..0]

    paris = Skyscanner::Connection.browse_quotes({ :country => "US", :currency => "USD", :locale => "en-US", :originPlace => "FR", :destinationPlace => "JFK", :outboundPartialDate => "anytime", :inboundPartialDate => "anytime" })
    @paris = sky.values.first[0..0]

    @paris_depart =  @paris[0]["OutboundLeg"]["DepartureDate"]

    Pari.create(flight: params[:flight],
                address: params[:address],
                name: params[:name],
                image: params[:image],
                flight: params[:flight],
                flight_date: params[:flight_date],
                address: params[:address],
                profile_image: params[:address],
                user_id: current_user.id)

    user_id = current_user.id
    redirect_to "/users/#{user_id}"
    # redirect_to "/paris/#{Pari.maximum(:id)}"
  end

  def edit
    puts params
    trip_id = params[:id]
    @paris = Pari.find(params[:id])
    @user = current_user
    redirect_to "/trips"
  end

  def update
    @paris =
      Pari.find(params[:id])
        if @paris.update(
          paris_params
          )
      else
      render 'edit'
    end
  end
  private
  def paris_params
    params.require(:pari).permit(:name,:image,:flight,:flight_date,:address,:profile_image,:user_id)
  end
end
