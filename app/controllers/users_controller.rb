class UsersController < ApplicationController
  def index
    response = HTTParty.get('http://api.eventful.com/json/events/search?location=Gainesville,fl&app_key=sZH3jKCFNTDRW7xC')
    @response = JSON.parse(response)
    @response = @response["events"]["event"]
  end
end
