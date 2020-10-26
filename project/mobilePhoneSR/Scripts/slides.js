/*Created by Chan Lim*/

"use strict";

$(document).ready(function () {

    /*var slideshow = myapp.slideshow;*/ // create the slideshow object for Sugmented Slide

    // create the namespace used by the application
    var myapp = myapp || {};

    // create the slideshow object and add it to the namespace
    myapp.slideshow = (function () {
        // private variables and functions
        var timer, play = true, speed = 2000;
        var nodes = { image: null, caption: null };
        var img = { cache: [], counter: 0 };

        var stopSlideShow = function () { clearInterval(timer); };
        var displayNextImage = function () {
            img.counter = ++img.counter % img.cache.length;
            var image = img.cache[img.counter];
            nodes.image.attr("src", image.src);
            nodes.caption.text(image.title);
        };

        // prototype object for public methods 
        var prototype = {
            loadImages: function (slides) {
                var image;
                for (var i = 0; i < slides.length; i++) {
                    image = new Image();
                    image.src = "Images/first/" + slides[i].href;
                    image.title = slides[i].title;
                    img.cache.push(image);
                }
                return this;
            },
            startSlideShow: function () {
                if (arguments.length === 2) {
                    nodes.image = arguments[0];
                    nodes.caption = arguments[1];
                }
                timer = setInterval(displayNextImage, speed);
                return this;
            },
            createToggleHandler: function () {
                var me = this;       // store 'this', which is the object literal 
                return function () {
                    // 'this' is the clicked button; 'me' is the object literal 
                    if (play) { stopSlideShow(); } else { me.startSlideShow(); }
                    this.value = (play) ? "Resume" : "Pause";
                    play = !play;   // toggle play flag
                };
            }
        };

        // property descriptor object(s)
        var properties = {
            interval: {
                get: function () { return speed; },
                set: function (s) {
                    speed = (isNaN(s) || s < 500) ? 2000 : s;
                    stopSlideShow();
                }
            },
            images: {
                get: function () {
                    return img.cache.slice(0);
                }
            }
        };

        // create and return the slideshow object
        return Object.create(prototype, properties);

    })(); // Invoke the IIFE

    //==================================================================================
    (function (mod) {
        mod.changeSpeed = function (speed) {
            this.interval = parseInt(speed);
            return this; // return 'this' so can be chained
        };
        mod.displaySlides = function () {
            var slides = this.images.map(function (current) {
                var pieces = current.src.split("/");
                return pieces[pieces.length - 1]; // return last array element
            });
            return slides.join(", ");
        };
    })(myapp.slideshow); // invoke IIFE; import the object to be augmented

    // Augmented slide show - Start ///////////////////////////////
    var slideshow = myapp.slideshow; // create the slideshow object for Sugmented Slide

    var slides = [
        { href: "iPhone_XS.jpg", title: "iPhone XS" },
        { href: "iPhone_XR.jpg", title: "iPhone XR" },
        { href: "SS_G10.jpg", title: "Galaxy 10" },
        { href: "SS_G9.jpg", title: "Galaxy 9" },
        { href: "SS_Note9.jpg", title: "Note 9" },
        { href: "LG_G7one.jpg", title: "G7one" },
        { href: "LG_V30.jpg", title: "V30" },
        { href: "LG_K9.jpg", title: "K9" },
        { href: "GG_Pixel3.jpg", title: "Pixel 3XL" },
        { href: "BB_Key2LE.jpg", title: "Key2 LE" }
    ];

    $("#play_pause").click(slideshow.createToggleHandler());
    $("#change_speed").click(function () {
        var ms = prompt("Current speed is "
            + slideshow.interval + " milliseconds.\n"
            + "Please enter a new speed in milliseconds."
            , 2000);
        slideshow.changeSpeed(ms).startSlideShow();
    });
    $("#view_slides").click(function () {
        alert(slideshow.displaySlides());
    });

    slideshow.loadImages(slides).startSlideShow($("#image"), $("#caption"));
    // Augmented slide show - End ///////////////////////////////

});

/*Created by Chan Lim*/
