// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$.ajax({
    type: "GET",
    dataType: "json",
    url: "https://congress.api.sunlightfoundation.com/legislators/locate?apikey=c31f9f2742674a9f8ee4e48183d8378e",
    data: "zip=27701",
    success: function (json) {

        $("h2").html(json.results[0].first_name + " " + json.results[0].last_name);
        $(".photo").html('<img src="http://theunitedstates.io/images/congress/225x275/' + json.results[0].bioguide_id + '.jpg"></img>');

        console.log( "JSON Data: " + json.results[0].first_name + " " + json.results[0].last_name );
    }});

