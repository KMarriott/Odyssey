module OahuHelper

  def format_date(arr)
    date = arr["OutboundLeg"]["DepartureDate"]
    date_arr = date.split("T")
    date_split = date_arr[0].split("-")
    date_combine = "#{date_split[1]}-#{date_split[2]}-#{date_split[0]}"
    puts date_combine
    return date_combine
  end
  def format_date(arr)
    time = primary_time(arr)
    puts time
    if time == "forever"
      return "forever"
    else

    end
    # date = arr["OutboundLeg"]["DepartureDate"]
    # date_arr = date.split("T")
    # date_split = date_arr[0].split("-")
    # date_combine = "#{date_split[1]}-#{date_split[2]}-#{date_split[0]}"
    # puts date_combine
    # return date_combine
  end
end
