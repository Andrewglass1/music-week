$(document).ready(function() {

  $('.slide-out-div-calendar').tabSlideOut({
    tabHandle: '.handle',                     //class of the element that will become your tab
    pathToTabImage: 'assets/calendar.png', //path to the image for the tab //Optionally can be set using css
    imageHeight: '128px',                     //height of tab image           //Optionally can be set using css
    imageWidth: '128px',                       //width of tab image            //Optionally can be set using css
    tabLocation: 'left',                      //side of screen where tab lives, top, right, bottom, or left
    speed: 300,                               //speed of animation
    action: 'click',                          //options: 'click' or 'hover', action to trigger animation
    topPos: '220px',                          //position from the top/ use if tabLocation is left or right
    leftPos: '50px',                          //position from left/ use if tabLocation is bottom or top
    fixedPosition: true                      //options: true makes it stick(fixed position) on scroll
  });

  $('.slide-out-div-album').tabSlideOut({
      tabHandle: '.albumhandle',                     //class of the element that will become your tab
      pathToTabImage: 'assets/play.png', //path to the image for the tab //Optionally can be set using css
      imageHeight: '128px',                     //height of tab image           //Optionally can be set using css
      imageWidth: '128px',                       //width of tab image            //Optionally can be set using css
      tabLocation: 'left',                      //side of screen where tab lives, top, right, bottom, or left
      speed: 300,                               //speed of animation
      action: 'click',                          //options: 'click' or 'hover', action to trigger animation
      topPos: '620px',                          //position from the top/ use if tabLocation is left or right
      leftPos: '50px',                          //position from left/ use if tabLocation is bottom or top
      fixedPosition: true                      //options: true makes it stick(fixed position) on scroll
  });
})