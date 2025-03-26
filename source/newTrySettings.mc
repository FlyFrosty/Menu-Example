import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;


class newTrySettings {

    function initialize() {
        menuSelector = Application.Storage.getValue("mySelection");
        
        if(menuSelector==null) {
            menuSelector=false;
        }
    }

    function saveSettings() {
        Application.Storage.setValue("mySelection",menuSelector);
    }

}

class newTrySettingsMenu extends WatchUi.Menu2 {

    var mySettings;

    function initialize() {
        
        Menu2.initialize(null);
        mySettings=new newTrySettings();
        Menu2.setTitle("Color");
 		Menu2.addItem(new WatchUi.ToggleMenuItem("Blue or Red", null,"mySelection",mySettings.menuSelector, null));
    }

}

class newTrySettingsMenuDelegate extends WatchUi.Menu2InputDelegate {

    var classView;

    function initialize(topView) {
        Menu2InputDelegate.initialize();
        classView = topView;
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        if (id.equals("mySelection")) {
            classView.mySettings.menuSelector = !classView.mySettings.menuSelector;
        }
    }

    function onBack() as Void {

        classView.newTrySettings.saveSettings();
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }


}