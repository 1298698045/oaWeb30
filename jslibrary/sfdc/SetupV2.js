/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
SfdcApp.SetupV2={};SfdcApp.SetupV2.landingPage={init:function(){var a=Sfdc.get("hideSetupV2WelcomeMessage");if(a)Sfdc.on(a,"click",function(){SfdcApp.SetupV2.landingPage.hideSetupV2WelcomeMessage()})},hideSetupV2WelcomeMessage:function(){Sfdc.Dom.hideByDisplay(Sfdc.get("setupV2WelcomeMessage"));UserContext.userPreferences.setBoolean("HideSetupV2WelcomeMessage",!0)}};if(document.getElementsByClassName)Sfdc.onReady(SfdcApp.SetupV2.landingPage.init);

//# sourceMappingURL=/javascript/1410512610000/sfdc/source/SetupV2.js.map
