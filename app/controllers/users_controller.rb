class UsersController < ApplicationController
  def index
    response = HTTParty.get('http://api.eventful.com/json/events/search?location=Gainesville,fl&app_key=sZH3jKCFNTDRW7xC')
    @response = JSON.parse(response)
    @response = @response["events"]["event"]
    @Users=User.new

  end

  def update
	@Users=User.all
	@Users.update!(params)
	puts params

  end


end
