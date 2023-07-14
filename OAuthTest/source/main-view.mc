import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

function createMainView() as Array<Views or InputDelegates> {
    return [ new MainView(), new MainBehaviorDelegate() ] as Array<Views or InputDelegates>;
}

class MainView extends WatchUi.View {

    hidden var myText;

    function initialize() {
        View.initialize();
    }

    // // Load your resources here
    // function onLayout(dc as Dc) as Void {
    //     setLayout(Rez.Layouts.MainLayout(dc));
    // }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        myText = new WatchUi.TextArea({
            :text=>"",
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_TINY,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER,
            :width=>160,
            :height=>160
        });
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        myText.setText("Values received:\n" + $.param_a + "\n" + $.param_b);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        myText.draw(dc);

        // Call the parent onUpdate function to redraw the layout
        // View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}

class MainBehaviorDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        showMainMenu();
        return true;
    }
}