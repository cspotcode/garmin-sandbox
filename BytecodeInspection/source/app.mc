import Toybox.Math;
import Toybox.System;
import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Background;
using Toybox.Authentication;
using FooModule;
using FooModule.BarModule;

function getApp() as MyApp {
    var a = self;
    // getApp();
    // $.getApp();
    return Application.getApp() as MyApp;
}
module ModTest {
    function getApp() as MyApp {
        var a = self;
        getApp();
        ModTest.getApp();
        return Application.getApp() as MyApp;
    }
}

var app as MyApp = null as MyApp;
var fooGlobalVar;
// var fooGlobalVar = MyApp.staticMethod();

class MyApp extends Application.AppBase {

    hidden var hiddenVar;
    public var publicVar;
    var fieldStoresReferenceToClass = MyApp;

    function initialize() {
        $.app = self;
        AppBase.initialize();
        fooMethod();
        System.println("fooGlobalVar = " + fooGlobalVar);
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    function getInitialView() as [ WatchUi.Views ] or [ WatchUi.Views, WatchUi.InputDelegates ] {
        new MyClasses.Foo();
        new MyClasses.Foo();
        return createMainView();
    }

    function fooMethod() {
        var a = self;
        fooGlobalVar = $.FooModule.BarModule.BarModuleMemberVariable;
        fooGlobalVar = FooModule.BarModule.BarModuleMemberVariable;
        fooGlobalVar = BarModule.BarModuleMemberVariable;
        // fooGlobalVar = BarModuleMemberVariable;
        staticMethod();
        MyApp.staticMethod();
    }
    static function staticMethod() {
        var a = self;
        getApp();
        $.getApp();
        staticMethodB();
    }
    static function staticMethodB() {
        for(var a = 0 as Number; a < 10; a += 1) {
            System.println("");
        }
    }
}

const gg = Globals;
class Globals {
    // truly global fns have overhead on each invocation to override their `self` w/ `getm`
    // Instead, wrap them in here
    static function foo() {}
    static function bar() {}
}
function foo() {
    System.println("hello this is global function foo");
}
module MyClasses {
    var gm = gg;
    class Foo {
        var gi = gg; // assignment executes for every `new Foo()`
        var b = System.println("hello this is Foo") as Null;
        function initialize() {
            Math.floor(1);
            new View();
            gg.foo();
            gm.foo();
            gi.foo();
            Globals.foo();
            foo();
            $.foo();
        }
    }
    class Bar {
        static function barFn() {}
    }
}