import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

function showSettingsMenu() {
    // var menu = new Rez.Menus.SettingsMenu();
    var menu = new Menu2(null);
    menu.addItem(new MenuItem("Set Exchange Rate", "Sub-Label", :setExchangeRate, null));
    WatchUi.pushView(menu, new SettingsInputDelegate(), WatchUi.SLIDE_UP);
}

class SettingsInputDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) as Void {
        if(item.getId() == :setExchangeRate) {
            $.exchangeRate.set($.exchangeRate.value + 1);
        }
        else if (item.getId() == :swapCurrencies) {
            swapPropertyValues($.currencyALabel, $.currencyBLabel);
            swapPropertyValues($.currencyADecimalPoints, $.currencyBDecimalPoints);
            swapPropertyValues($.currencyAValue, $.currencyBValue);
        }
        WatchUi.popView(SLIDE_IMMEDIATE);
    }

    function swapPropertyValues(a as Property, b as Property) {
        var aValue = a.value;
        a.set(b.value);
        b.set(aValue);
    }
}