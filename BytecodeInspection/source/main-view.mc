import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

function createMainView() {
    return [ new MainView(), new MainBehaviorDelegate() ];
}

class MainView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    function onUpdate(dc as Dc) {
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
        showSettingsMenu();
        // return false to allow stacking system menu on top of ours
        return true;
    }
}