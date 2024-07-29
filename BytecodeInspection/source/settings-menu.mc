import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

function showSettingsMenu() {
    var menu = new Menu2({});
    WatchUi.pushView(menu, new SettingsInputDelegate(), WatchUi.SLIDE_UP);
}

class SettingsInputDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        WatchUi.popView(SLIDE_IMMEDIATE);
    }
}