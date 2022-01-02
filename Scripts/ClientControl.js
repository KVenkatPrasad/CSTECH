/// <reference name="MicrosoftAjax.js"/>

Type.registerNamespace("DATA");

DATA.ClientControl = function(element) {
    DATA.ClientControl.initializeBase(this, [element]);
}

DATA.ClientControl.prototype = {
    initialize: function() {
        DATA.ClientControl.callBaseMethod(this, 'initialize');
        
        // Add custom initialization here
    },
    dispose: function() {        
        //Add custom dispose actions here
        DATA.ClientControl.callBaseMethod(this, 'dispose');
    }
}
DATA.ClientControl.registerClass('DATA.ClientControl', Sys.UI.Control);

if (typeof(Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
