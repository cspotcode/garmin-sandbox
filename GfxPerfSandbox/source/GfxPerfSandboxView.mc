import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class GfxPerfSandboxView extends WatchUi.WatchFace {

    var data;
    function initialize() {
        WatchFace.initialize();
        data = new[100]b as ByteArray;
        for (var i = 0; i < 100; i++) {
            var r = Math.rand() % 2;
            // if(i < 10) {
            //     System.println(r);
            // }
            data[i] = i % 3 == 0 ? 0 : 1;
        }
        var charArray = new[3];
        charArray[0] = 'a';
        charArray[1] = 'b';
        charArray[2] = 'c';
        var string = StringUtil.charArrayToString(charArray);
        System.println(string);
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        // setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // // Get and show the current time
        // var clockTime = System.getClockTime();
        // var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        // var view = View.findDrawableById("TimeLabel") as Text;
        // view.setText(timeString);

        var opts = {:fromRepresentation => StringUtil.REPRESENTATION_BYTE_ARRAY, :toRepresentation => StringUtil.REPRESENTATION_STRING_HEX};

        var before = System.getTimer();

        var d = data;

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        // var str = StringUtil.convertEncodedString(d, opts);
        // dc.drawText(0, 0, Graphics.FONT_MEDIUM, str, Graphics.TEXT_JUSTIFY_LEFT);

        for(var y = 40; y < 50; y++) {
            var yoffset = (y - 40) * 10;
            for(var x = 40; x < 50; x++) {
                var offset = yoffset + x - 40;
                if(d[offset] == 1) {
                    dc.drawPoint(x, y);
                }
            }
        }
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
        for(var y = 40; y < 50; y++) {
            var yoffset = (y - 40) * 10;
            for(var x = 40; x < 50; x++) {
                var offset = yoffset + x - 40;
                if(d[offset] == 0) {
                    dc.drawPoint(x, y);
                }
            }
        }
        var after = System.getTimer();
        var diff = after - before;
        dc.drawText(100, 100, Graphics.FONT_MEDIUM, diff.toString() + "ms ", Graphics.TEXT_JUSTIFY_LEFT);

        // Call the parent onUpdate function to redraw the layout
        // View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
