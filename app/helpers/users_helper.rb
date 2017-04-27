module UsersHelper
  def  primary_image(response)
      response = response["image"] || {"small" => { "url" => "foo.jpg"}}
  end

  def  primary_time(response)
      response = response["stop_time"] || "forever"
  end
  
  def  primary_address(response)
      response = response["venue_address"] || response["city_name"]
  end
end
