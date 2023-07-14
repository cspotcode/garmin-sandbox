import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Background;
import Toybox.Authentication;

function getApp() as OAuthTestApp {
    return Application.getApp() as OAuthTestApp;
}

// Value received from oauth, shown on main view and sent with subsequent
// oauth requests
var message = "<no value received>";

(:background)
class OAuthTestApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        Authentication.registerForOAuthMessages(method(:onOauthMessage));
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return createMainView();
    }

    function onOauthMessage(message as OAuthMessage) {
        var data = message.data as Dictionary;
        // Simulator gives us extra oauth message without data ??
        if (data == null) { return; }

        System.println(message);
        System.println(message.responseCode);
        System.println(data);
        // $.message = message.responseCode.format("%d");
        $.message = data["param_a"];
        if ($.message == null) {
            $.message = "<unexpected response from oauth>";
        }
        WatchUi.requestUpdate();
    }

    // TODO this doesn't actually do anything ATM
    function getServiceDelegate() {
        return [new MyServiceDelegate()];
    }

}
