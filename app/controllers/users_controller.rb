class UsersController < ApplicationController
  def index
    response = HTTParty.get('http://api.eventful.com/json/events/search?location=Gainesville,fl&app_key=sZH3jKCFNTDRW7xC')
    @response = JSON.parse(response)
    @response = @response["events"]["event"]

  end

  def show
    @user_id = params[:id]
    # if current_user.id  == user
    if User.joins(:paris).where(:id => @user_id)[0]
      @user_trips_paris = User.joins(:paris).where(:id => @user_id)[0].paris
    end
    if User.joins(:oahus).where(:id => @user_id)[0]
      @user_trips_oahu = User.joins(:oahus).where(:id => @user_id)[0].oahus
    end
    if User.joins(:cuba_trips).where(:id => @user_id)[0]
      @user_trips_cuba = User.joins(:cuba_trips).where(:id => @user_id)[0].cuba_trips
    end

  end

end
