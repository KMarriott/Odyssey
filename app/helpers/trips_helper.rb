module TripsHelper
  def  eventful_image(response)
      response = response["image"] || {"large" => { "url" => "http://i.imgur.com/XvtEi2t.jpg"}}

  end

  def  primary_time(response)
      response = response["stop_time"] || "forever"
  end

  def  primary_address(response)
      response = response["venue_address"] || response["city_name"]
  end
end
