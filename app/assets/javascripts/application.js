// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
	//var pusher = new Pusher(pusher_key, pusher_channel)
	var pusher = new Pusher(pusher_key);
	var channel = pusher.subscribe(pusher_channel);
	//var fin_time = @ride_time_output;

	pusher.bind('rider_finish', function(rider){
		console.log("Here here rider finish");
		$("tr#" + rider.id).children("#td_finish").text(rider.finish_time);
		$("tr#" + rider.id).children("#td_ride_time").text(rider.finish_time);
	});

//pusher.bind('leader_board', function(rider){
//	console.log("Leader board triggered");
//	$("tr#" + rider.id).children("#td_finish").text(rider.finish_time);
//});

});
