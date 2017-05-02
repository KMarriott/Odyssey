// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

$('.mySlides').click(function () {
	console.log('clicked')
  $('.myNames').hide();
});

console.log('working')


var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/US/USD/en-US/UK/anywhere/anytime/anytime?apiKey=od357280409789380362594759932174",
  "method": "GET",
  "headers": {
    "cache-control": "no-cache",
    "postman-token": "c16e3e30-9364-d7aa-23cc-e476f49ccc58"
  }
}

