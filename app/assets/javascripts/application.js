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

        var leg1 = json.results[0];
        var leg2 = json.results[1];
        var leg3 = json.results[2];

        if (leg.title === "Rep") {
            office = "House Representative"
        } else if (leg.title === "Sen" && leg.state_rank === "senior") {
            office = "Senior Senator"
        } else if (leg.title === "Sen" && leg.state_rank === "junior") {
            office = "Junior Senator"
        } else {
            office = "Delegate"
        }

        if (leg.party === "R") {
            party = "Republican"
        } else if (leg.party === "D") {
            party = "Democrat"
        } else {
            party = "Independent"
        }

        $("h2").html(leg.first_name + " " + leg.last_name);
        $(".photo").html('<img src="http://theunitedstates.io/images/congress/225x275/' + leg.bioguide_id + '.jpg"></img>');
        $("img").error(function () {
            $(this).unbind("error").attr("src", "http://www.keralabjp.org/images/No_Image.jpg");
        });
        $(".twitter_handle").html("<a href='https://twitter.com/intent/user?screen_name=" + leg.twitter_id + "'><i class='fa fa-twitter-square'></i> @" + leg.twitter_id + "</a>");
        $(".header").html(office);
        $(".start_date").html(leg.term_start);
        $(".end_term_date").html(leg.term_end);
        $(".party").html(party);
        $(".phone_number").html('<a href="tel:+' + leg.phone + '"><i class="fa fa-phone-square"></i> ' + leg.phone + '</a>');
        $(".message").attr("href", leg.contact_form);

    }});

