import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class GfxPerfSandboxView extends WatchUi.WatchFace {

    var data;
    var populateProgress = 0;
    var font;
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        // setLayout(Rez.Layouts.WatchFace(dc));
        data = new[10000]b as ByteArray;
        var charArray = new[3];
        charArray[0] = 'a';
        charArray[1] = 'b';
        charArray[2] = 'c';
        var string = StringUtil.charArrayToString(charArray);
        System.println(string);
        font = WatchUi.loadResource( $.Rez.Fonts.GfxFont );
    }

    function continuePopulateData() {
        if(populateProgress >= 25) { return; }
        var p = populateProgress * 400;
        var till = p + 400;
        for (var i = p; i < till; i++) {
            // var r = Math.rand() % 2;
            // if(i < 10) {
            //     System.println(r);
            // }
            // data[i] = i % 3 == 0 ? 0 : 1;
            data[i] = i % 3 == 0 ? 65 : 66;
            if (i % 100 == 99) {
                data[i] = 10;
            }
        }
        populateProgress += 1;
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

        continuePopulateData();

        var opts = {:fromRepresentation => StringUtil.REPRESENTATION_BYTE_ARRAY, :toRepresentation => StringUtil.REPRESENTATION_STRING_PLAIN_TEXT};
        // var opts = {:fromRepresentation => StringUtil.REPRESENTATION_BYTE_ARRAY, :toRepresentation => StringUtil.REPRESENTATION_STRING_HEX};

        var before = System.getTimer();

        var d = data;
        var f = font;

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        var str = StringUtil.convertEncodedString(d, opts);
        dc.drawText(0, 0, f, str, Graphics.TEXT_JUSTIFY_LEFT);

        // for(var y = 0; y < 10; y++) {
        //     var yoffset = y * 10;
        //     for(var x = 0; x < 10; x++) {
        //         var offset = yoffset + x;
        //         if(d[offset] == 1) {
        //             dc.fillRectangle(40 + x * 6, 40 + y * 6, 6, 6);
        //         }
        //     }
        // }
        // dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
        // for(var y = 0; y < 10; y++) {
        //     var yoffset = y * 10;
        //     for(var x = 0; x < 10; x++) {
        //         var offset = yoffset + x;
        //         if(d[offset] == 0) {
        //             dc.fillRectangle(40 + x * 6, 40 + y * 6, 6, 6);
        //         }
        //     }
        // }
        var after = System.getTimer();
        var diff = after - before;
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(100, 100, Graphics.FONT_MEDIUM, diff.toString() + "ms " + populateProgress, Graphics.TEXT_JUSTIFY_LEFT);

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
