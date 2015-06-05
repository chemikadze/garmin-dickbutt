using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Math;


class garmindickbuttView extends Ui.WatchFace {

	var centerX, centerY;
	var watchRadius;
    //! Load your resources here
    function onLayout(dc) {
		centerX = dc.getWidth() / 2;
		centerY = dc.getHeight() / 2;
		if (centerX > centerY) {
			watchRadius = centerY;
		} else {
			watchRadius = centerX;
		}
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {	
    }

    //! Update the view
    function onUpdate(dc) {    	
 		View.onUpdate(dc); 		
		var time = Sys.getClockTime();
        var hrAngle = 2 * Math.PI * (time.hour + time.min / 60.0) / 12.0 - Math.PI / 2;
        var minAngle = 2 * Math.PI * time.min / 60.0 - Math.PI / 2;
        dc.fillCircle(centerX, centerY, 3);
        drawArrow(dc, minAngle, watchRadius * 0.9);
        drawArrow(dc, hrAngle, watchRadius * 0.7);
    }
    
    hidden function drawArrow(dc, x, length) {    	
    	dc.fillPolygon([
    		[centerX + Math.cos(x + Math.PI * 2 / 3) * 5, centerY + Math.sin(x + Math.PI * 2 / 3) * 5],
    		[centerX + Math.cos(x) * length, centerY + Math.sin(x) * length],
    		[centerX + Math.cos(x - Math.PI * 2 / 3) * 5, centerY + Math.sin(x - Math.PI * 2 / 3) * 5]
    	]);
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}

class garmindickbuttApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new garmindickbuttView() ];
    }

}