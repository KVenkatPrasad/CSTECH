/// <reference name="MicrosoftAjax.js"/>

Type.registerNamespace("DATA");

DATA.ClientBehavior = function(element) {
    DATA.ClientBehavior.initializeBase(this, [element]);
}

DATA.ClientBehavior.prototype = {
    initialize: function() {
        DATA.ClientBehavior.callBaseMethod(this, 'initialize');
        
        // Add custom initialization here
    },
    dispose: function() {        
        //Add custom dispose actions here
        DATA.ClientBehavior.callBaseMethod(this, 'dispose');
    }
}
DATA.ClientBehavior.registerClass('DATA.ClientBehavior', Sys.UI.Behavior);

if (typeof(Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
