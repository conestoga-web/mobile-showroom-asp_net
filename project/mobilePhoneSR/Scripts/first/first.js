/*Created by Chan Lim*/

"use strict";

$(document).ready(function(){
	
    var slideshow = myapp.slideshow; // create the slideshow object for Sugmented Slide
   
     // Augmented slide show - Start ///////////////////////////////   
    var slides = [
        {href:"1.jpg", title:"20 Barrel Yards Blvd. Waterloo"}, 
        {href:"2.jpg", title:"6 Brybeck Crescent Kitchener"},
        {href:"3.jpg", title:"49 Vanier Dr. Kitchener"},
        {href:"4.jpg", title:"67 Valleyview Rd. Kitchener"},
        {href:"5.jpg", title:"81 York St. Kitchener"},
        {href:"6.jpg", title:"499 Albert St. Kitchener"},
        {href:"7.jpg", title:"545 Belmont Ave West Kitchener"}
    ];
    
    $("#play_pause").click( slideshow.createToggleHandler() );  
    $("#change_speed").click( function() {
        var ms = prompt( "Current speed is " 
            + slideshow.interval + " milliseconds.\n"
            + "Please enter a new speed in milliseconds."
       , 2000 );
        slideshow.changeSpeed(ms).startSlideShow();
    });
    $("#view_slides").click( function() {
        alert( slideshow.displaySlides() );
    });
    
    slideshow.loadImages(slides).startSlideShow( $("#image"), $("#caption") );
    // Augmented slide show - End ///////////////////////////////
   
});

/*Created by Chan Lim*/



