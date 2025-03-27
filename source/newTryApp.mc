import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class newTryApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }


    // Return the initial views of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new newTryView();
        
        return [view, new newTryDelegate()];
    }

    function getSettingsView() as [Views] or [Views, InputDelegates] or Null {
        var menu = new newTrySettingsMenu();

        return [menu, new newTrySettingsMenuDelegate(menu)];
    }

}

function getApp() as newTryApp {
    return Application.getApp() as newTryApp;
}

