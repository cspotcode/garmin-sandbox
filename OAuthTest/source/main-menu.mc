import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

function showMainMenu() {
    var menu = new Menu2({});
    menu.addItem(new MenuItem("Oauth", null, :oauth, {}));
    menu.addItem(new MenuItem("Open browser", null, :openbrowser, {}));
    WatchUi.pushView(menu, new MainMenuInputDelegate(), WatchUi.SLIDE_UP);
}

class MainMenuInputDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        if(item.getId() == :oauth) {
            Authentication.makeOAuthRequest(
                "https://cspotcode.com/garmin-sandbox/index.html",
                createParams(),
                "This URL does not matter at all?", Authentication.OAUTH_RESULT_TYPE_URL,
                {
                    "param_a" => "param_a",
                    "param_b" => "param_b"
                }
            );
        }
        else if (item.getId() == :openbrowser) {
            Communications.openWebPage("https://cspotcode.com/garmin-sandbox/index.html", createParams(), null);
        }
        WatchUi.popView(SLIDE_IMMEDIATE);
    }

    private function createParams() as Dictionary {
        return {
            "param_a" => $.param_a
        };
    }
}