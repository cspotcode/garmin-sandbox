import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

function createMainView() as Array<Views or InputDelegates> {
    return [ new MainView(), new MainBehaviorDelegate() ] as Array<Views or InputDelegates>;
}

class MainView extends WatchUi.View {

    hidden var currencyAText as WatchUi.Text = null as WatchUi.Text;
    hidden var exchangeRateText as WatchUi.Text = null as WatchUi.Text;
    hidden var currencyBText as WatchUi.Text = null as WatchUi.Text;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
        currencyAText = findDrawableById("currencyA") as WatchUi.Text;
        currencyBText = findDrawableById("currencyB") as WatchUi.Text;
        exchangeRateText = findDrawableById("exchangeRate") as WatchUi.Text;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
        render();
    }

    function render() as Void {
        currencyAText.setText($.currencyALabel.value + " " + $.currencyAValue.value.format("%." + $.currencyADecimalPoints.value + "f"));
        exchangeRateText.setText("x " + $.exchangeRate.value.format("%.2f") + " =");
        currencyBText.setText($.currencyBLabel.value + " " + $.currencyBValue.value.format("%." + $.currencyBDecimalPoints.value + "f"));
        WatchUi.requestUpdate();
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