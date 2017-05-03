// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){

	$('.carousel').carousel();

  $('.date_clicker_button').on('click', function(){
    event.preventDefault(); 
    getquotes()
    $('#hide').show()
  })

  // $('.dropdown-menu').dropdown()
  // $('.dropdown-toggle').dropdown()
  $('.dropdown-menu').dropdown('toggle')
    // $('.dropdown-menu').dropdown()

  });


function getquotes(){
  var arrival = $('.flight_leave').val()
  var departure = $('.flight_return').val()

  if(arrival === "")
  {
    arrival = "anytime"
  }
    if(departure === "")
  {
    departure = "anytime"
  }

  console.log(arrival + " " + departure)
  
  data =  {
      "arrival": arrival,
      "departure": departure
    }

  var settings = {
    "crossDomain": true,
    "url": "/skyscanner",
    "data": data,
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }

  $.ajax(settings).done(function (response) {
    console.log(response)

$("p.DepartureDate").text(response[0]["OutboundLeg"]["DepartureDate"].substring(0, 10))
     //Price:
     $("p.Price").text(response[0]["MinPrice"])
     // Carrier Id:
     $("p.Carrier_id").text(response[0]["InboundLeg"]["CarrierIds"])
     // direct
     $("p.Direct").text(response[0]["Direct"])

    // $.each(response, function(one){

    //   //$('')

    //   //Departure Date
    //   console.log(response[one]["OutboundLeg"]["DepartureDate"].substring(0, 10))
    //   //Price:
    //   console.log(response[one]["MinPrice"])
    //   // Carrier Id:
    //   console.log(response[one]["InboundLeg"]["CarrierIds"])
    //   // direct 
    //   console.log(response[one]["Direct"])
    // })

      //Departure Date
      $("p.DepartureDate").text(response[0]["OutboundLeg"]["DepartureDate"].substring(0, 10))
      //Price:
      $("p.Price").text(response[0]["MinPrice"])
      // Carrier Id:
      $("p.Carrier_Id").text(response[0]["InboundLeg"]["CarrierIds"])
      // direct 
      $("p.direct").text(response[0]["Direct"])

  });
}


function getevents(){
 
  data =  {
      "arrival": arrival,
      "departure": departure
    }

  var settings = {
    "crossDomain": true,
    "url": "/skyscanner",
    "data": data,
    "method": "GET",
    "headers": {
      "cache-control": "no-cache"
    }
  }

  $.ajax(settings).done(function (response) {
    console.log(response)
    $.each(response, function(one){
      //Departure Date
      console.log(response[one]["OutboundLeg"]["DepartureDate"].substring(0, 10))
      //Price:
      console.log(response[one]["MinPrice"])
      // Carrier Id:
      console.log(response[one]["InboundLeg"]["CarrierIds"])
      // direct 
      console.log(response[one]["Direct"])
    }
      )


  });
}

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  x[slideIndex-1].style.display = "block";
}
