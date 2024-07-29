import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Background;
import Toybox.Authentication;

function getApp() as CurrencyConverterApp {
    return Application.getApp() as CurrencyConverterApp;
}

var app as CurrencyConverterApp = null as CurrencyConverterApp;

var exchangeRate as Property;
var currencyALabel as Property;
var currencyADecimalPoints as Property;
var currencyAValue as Property;
var currencyBLabel as Property;
var currencyBDecimalPoints as Property;
var currencyBValue as Property;

typedef PropertyValue as Number or String;

class Property {
    var name as String;
    var value as PropertyValue;

    function initialize(name as String) {
        self.name = name;
        self.value = Application.Properties.getValue(name);
    }

    function set(value as PropertyValue) {
        self.value = value;
        Application.Properties.setValue(self.name, value);
    }
}

class CurrencyConverterApp extends Application.AppBase {

    function initialize() {
        $.app = self;
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        // Read the currency conversion exchange rate from persistent storage
        $.exchangeRate = new Property("exchangeRate");
        $.currencyALabel = new Property("currencyALabel");
        $.currencyADecimalPoints = new Property("currencyADecimalPoints");
        $.currencyAValue = new Property("currencyAValue");
        $.currencyBLabel = new Property("currencyBLabel");
        $.currencyBDecimalPoints = new Property("currencyBDecimalPoints");
        $.currencyBValue = new Property("currencyBValue");
    }

    function getInitialView() as Array<Views or InputDelegates>? {
        return createMainView();
    }

    // Widgets don't have this
    // function getSettingsView() as Array<Views or InputDelegates>? {
    //     return createSettingsView();
    // }
}
