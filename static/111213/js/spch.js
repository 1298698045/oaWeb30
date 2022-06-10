
    /*SFDC
    /
    / Please note that this file contains SFDC specific changes that should
    / be integrated when the version is updated
    /
    / SFDC
    */

// (c)2000-2008 SpellChecker.net,Inc.  All rights reserved.  www.SpellChecker.net


var spchver="";
var sp_sh="";
var schema_url="";
var schema="";
var spp_langs="";
var url=""; //cgrabill: I think this should be set in doSpell()
var service_host="";
var customerid="1:M7Z3f3-iklBm4-JxowF-9crhl-P0Tbt3-nXzeO3-2lRfT-bryRD-Uj4xv3-wKBMb4-749Zb2-ywX5w3";
var cust_dic_ids="";
var udn="";
/*~var hide="";*/
var doc_blank="/lf/blank.html";
var doc_initialize = "?cmd=script&doc=wsc_core&name=initialize";
var doc_blankform="/lf/blankform.html";
var doc_process="/script/ssrv.cgi";
var is_window_opened=false;
var formNum=-1;
var ctrlName='';
//var isMSIE=(navigator.appName=='Microsoft Internet Explorer'); //SFDC: W-2032235
//var isNN=navigator.appName=='Netscape'; //SFDC: W-2032235
var isProxyVer=false;
var botf,cmd,spellWin,ssrv_host,port,ssrv,ssrvname,lang,ctrl,url,force_reload,intlang,ctrlObj,sp_i,sp_doc,sp_time,sp_old_doc_unload,sp_spw_name,sp_spw_params,sp_wurl,sp_asce,sp_iswopn,autoClose;
var nothing, noSupport;
var sRelaxedDomain = "";
var sReferer = document.location.href;
var onCancel = null;
var onFinish = null;
var onClose = null;
var windowTitle = "";

var isCallbackInvokedInSession = false;
var ssl = '';
var sp_addurl = '';
/**
* API Function
* @param {Object} oParams
* object params:
*   oParams.lang {String} one of allowed lang names
*   oParams.ctrl {Mixed} control id or array of ids
*   oParams.cmd {String} 'spell' or 'grammar' or 'thes'
*   oParams.forceReload
*   oParams.intLang {String} - interface language @see oParams.lang
*   oParams.userDictionaryName {String} - fixed dictionary name
*   oParams.customDictionaryName {Array} - additional custom (customer) dictionary identifiers array
*   oParams.schemaIdentifier {int} - schema identifier
*   oParams.isProxyVer {Boolean} -
*   oParams.width {int} - window width
*   oParams.height {int} - window height
*   oParams.top {int} - window initial y coortinate
*   oParams.left {int} - window initial x coortinate
*   oParams.title {String} - window title

*   oParams.autoClose {String} - no|yes|nomisspellings
*   oParams.domainName {String} - common domain name (relaxed script solution)
*   oParams.schemaURI{String} - custom CSS url ("")
*   oParams.onCancel {Function} - Callback function
*   oParams.onFinish {Function} - Callback function
*   oParams.onClose {Function} - Callback function
*   
*   p_nothing, p_noSupport, p_noLangSupport - SFDC-provided localized messages
*/

function doSpell(oParams, p_url, p_sp_sh, p_nothing, p_noSupport, p_noLangSupport){

    if(typeof(oParams) != 'object' || !oParams.ctrl){
        alert('Wrong initial data');
        return;
    }

    sp_sh = p_sp_sh;
    service_host = sp_sh;

    url=p_url;
    doc_initialize = url+doc_initialize;
    nothing = p_nothing;
    noSupport = p_noSupport;
    noLangSupport = p_noLangSupport;

    var reg = /^(?:(http[s]?):)?(\/{2})?([0-9.\-A-Za-z]+)?(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/i;

    var old_url = url;
    // parse sproxy urls
    var a_sproxy = reg.exec(url);
    // parse spellchecker service urls
    var a_sp_sh   = reg.exec(sp_sh);
    // parse document location url]
    var a_doc_url   = reg.exec(document.location);
    var doc_protocol = a_doc_url[1] || document.location.protocol.replace(":","");
    var ssl_mode = 'https' == doc_protocol ? "on" : "off";
    // compose sproxy url if host not defined
    if (!a_sproxy[3]){
        var sp_protocol = (a_sproxy[1] || doc_protocol) + "://";
        var sp_port  = typeof  a_sproxy[4] !== 'undefined' && a_sproxy[4] !== '' ? ":"+a_sproxy[4] : "";
        var sp_path  = typeof  a_sproxy[5] !== 'undefined' && a_sproxy[5] !== '' ? a_sproxy[5] : "";
        var sp_query = typeof  a_sproxy[6] !== 'undefined' && a_sproxy[6] !== '' ? "?"+a_sproxy[6] : "";
        url =  sp_protocol + document.location.host + sp_port + "/" + sp_path + sp_query  ;
        sp_addurl = escape(url);
    }

    // if real document protocol not equal sproxy or ssrv urls
    // will proceed protocol correction
    if ( a_doc_url[1] !== a_sp_sh[1]  || a_doc_url[1] !== a_sproxy[1]){

    	if (a_sproxy[1] != 'undefined' && a_sproxy[1] != '') {
	        // correct sproxy url
	        url = url.replace(new RegExp("^"+ a_sproxy[1]+""), doc_protocol);
	        // correct ssrv url
	        // sp_sh = sp_sh.replace('/^'+a_sp_sh[1]+'/i', doc_protocol);
	        sp_sh = sp_sh.replace(new RegExp("^"+ a_sp_sh[1]+""), doc_protocol);
    	}
        // reinitual global vars (add ssl var)
        service_host=sp_sh;
        doc_initialize = url+"?ssl="+ssl_mode+"&cmd=script&doc=wsc_core&name=initialize";
        // set global flag
        ssl = ssl_mode;
    }

    //relaxed scripting solution
    if(typeof(oParams.domainName) == "string" && (/^\s*$/).test(oParams.domainName) == false){
        sRelaxedDomain = oParams.domainName
        document.domain = sRelaxedDomain;
    }
    mSourceCtrlsNames = oParams.ctrl;


    if (oParams.ctrl && typeof oParams.ctrl == "object" && oParams.ctrl.length){
        //spellCheckMultipleInstances(oParams.ctrl, oParams.lang, oParams.schemaIdentifier);
        spellCheckMultipleInstances(oParams); //cgrabill: TODO is this right?
    }else{
        spellCheckSingleInstance(oParams);
    }
}

/**
*
*/
function spellCheckSingleInstance(oParams){
    /*
     * SFDC: W-2032235
     * Since the Spellchecker supports more browser versions than Salesforce does,
     * don't bother checking the browser version.
     */
    //if((isMSIE&&(parseInt (navigator.appVersion)< 4)) || (isNN&&isAppVer('3.0') && !(/safari/i).test(navigator.appVersion))){
        /*SFDC
        /
        / Localized message, noSupport
        /
        / SFDC
        */
        //alert(noSupport);
        //Spellchecker message:
        //alert('Sorry, currently we do not support your browser.');
        //return;
    //}

    /*
     * SFDC
     * 
     * If the language isn't one that the Spellchecker supports,
     * we display a popup to the user with a localized message
     * W-1150126
     * 
     * SFDC
     */
    // lang = oParams.lang || "en";
    lang = oParams.lang;
    if (!lang || lang == "null" || lang == "") {
    	alert(noLangSupport);
    	return;
    }
    
    cmd = oParams.cmd || "spell";
    ctrl = oParams.ctrl || null;
    force_reload = (oParams.forceReload != null)?oParams.forceReload:(true);
    intlang = oParams.intLang || "";
    /*~hide = oParams.hide || "";	*/
    isProxyVer = (oParams.isProxyVer != null)?(oParams.isProxyVer):isProxyVer;
    udn = oParams.userDictionaryName || udn;
    cust_dic_ids = oParams.customDictionaryName || cust_dic_ids;
    if(cust_dic_ids.constructor &&  cust_dic_ids.constructor.toString().toLowerCase().indexOf("array") != -1){
        cust_dic_ids = cust_dic_ids.join(',');
    }
    schema = oParams.schemaIdentifier || schema;
    schema_url = oParams.schemaURI || schema_url;
    
    autoClose = oParams.autoClose || 'no';

    onCancel = oParams.onCancel || onCancel;
    onFinish = oParams.onFinish || onFinish;
    onClose = oParams.onClose || onClose;

    var wWidth = (parseInt(oParams.width)>0)?(oParams.width):(492);
    var wHeight = (parseInt(oParams.height)>0)?(oParams.height):(440);

    var wTop = (parseInt(oParams.top)>=0)?(oParams.top):(null);
    var wLeft = (parseInt(oParams.left)>=0)?(oParams.left):(null);
    windowTitle = oParams.title;

    if(ctrl.id=="MTBDummy"){
        ctrlName = ctrl.id;
        ctrlObj = ctrl;
    } else {
        var nObj = document.getElementById(ctrl);
        
        if (nObj == null){
            alert('Source element "' + ctrl + '" not found');
            return;
        }
        
        if (nObj["type"] == "hidden") {
        	/*
        	 * SFDC
        	 * 
        	 * For Html (Rich-text) editors, the
        	 * oParams.ctrl value is the id for the hidden div
        	 * associated with the RTE. The actual editor
        	 * id should be "iframe_" + oParams.ctrl
        	 * 
        	 * SFDC
        	 */
        	
        	var rteId = "iframe_" + ctrl;
        	var rteObj = document.getElementById(rteId);
        	if (rteObj.contentWindow) {
        		ctrl = rteId;
        		nObj = rteObj;
        	}
        }
        
        ctrlName = ctrl;
        ctrlObj = nObj;
    }

    if(/^\s*$/.test(getSourceObjectContent(ctrlObj,true))){
        /*SFDC
        /
        / Localized message, errNothing
        /
        / SFDC
        */
        alert(nothing);
        return;
    }

    sp_time = "";

    if(isProxyVer){
        if(service_host==sp_sh){

            if((/:\/\/(.*?)\//).test(service_host)){
                ssrv_host = RegExp.$1
            }else{
                ssrv_host = '';
            }
            /*~}*/
            (/(^.*\/)(.*)/).test(url);
            service_host = RegExp.$1;
            ssrvname = RegExp.$2;
        }
        doc_blank=ssrvname+"?cmd=script&doc=wsc_core&name=blank&ssrv_host="+ssrv_host;
        doc_blankform=ssrvname+"?cmd=script&doc=wsc_core&name=blankform&ssrv_host="+ssrv_host;
        doc_process=ssrvname;
    } else {
        ssrv_host='';
        port='';
        ssrv='';
        ssrvname='';
    }
    if(is_window_opened){
        is_window_opened = false;
    }

    botf=167;
    if(window.name==''){
        window.name='sp_ch_opener_window';
    }
    wndname=window.name;
    
    /*
     * SFDC
     * 
     * Reset the focus on the text area for when the user returns
     * from the Spellchecker before creating the popup
     * 
     * SFDC
     */
    if (ctrl) {
		var txtArea = document.getElementById(ctrl);
		if (txtArea.contentWindow) {
			// This is for Rich-text editors
			txtArea.contentWindow.focus();
		} else {
			// This is for regular text areas
			txtArea.focus();
		}
    }
    if(!is_window_opened){
        sp_spw_name = createIdentifier("spch"+document.location.host+sp_time);
        sp_spw_params = "width="+wWidth+",height="+wHeight+",toolbar=no,resizable=no";
        if(wTop!= null){
            sp_spw_params += ",top=" + wTop;
        }
        if(wLeft!= null){
            sp_spw_params += ",left=" + wLeft;
        }


        /*
         * SFDC
         * 
         * Go directly to the Spellchecker
         * See W-839842
         * 
         * SFDC
         */
        sp_wurl = getSPWU();
        isCallbackInvokedInSession = false;
        spellWin = window.open(sp_wurl,sp_spw_name,sp_spw_params);
        spellWin.opener=window;
    }
    spellWin.focus();
    return;
}

function initWSCFrames(){
	/*
	 * SFDC
	 * 
	 * ltran (168) - Don't do anything in this method. It is called during
	 * the call to window.open() and is used to set the popup's URL to the
	 * Spellchecker. We now set the correct URL in the call to window.open()
	 * in the spellCheckSingleInstance() method.
	 * See W-839842
	 * 
	 * SFDC
	 */ 
	
	// spellWin.location.replace(getSPWU());
    return;
}

function getSPWU(){
    var sBlankDocUrl = escape(addUrlParam((service_host+doc_blank),"relaxedDomain",sRelaxedDomain));
    var sBlankFormDocUrl = escape(addUrlParam((service_host+doc_blankform),"relaxedDomain",sRelaxedDomain));
    /*~return url+'?cmd=script&doc=wsc_core&name=frm&qw=&ctrlname=&firstframeh=<#TOPHEIGHT#>&thirdframeh='+botf+'&fifthframe=&docblank='+sBlankDocUrl+'&docblankform='+sBlankFormDocUrl+'&hide='+hide + '&relaxedDomain=' + (sRelaxedDomain?sRelaxedDomain:'');*/
    /* cgrabill: this commented version is from the new jsreturn url+'?cmd=script&doc=wsc_core&name=frm&qw=&ctrlname=&firstframeh=<#TOPHEIGHT#>&thirdframeh='+botf+'&fifthframe=&docblank='+sBlankDocUrl+'&docblankform='+sBlankFormDocUrl+'&relaxedDomain=' + (sRelaxedDomain?sRelaxedDomain:''); */
    //cgrabill: the rest of this method is copied from old js. 
    //TODO which one is right?
    var spwurl = url+'?ssl='+ssl+'&cmd=script&doc=wsc_core&name=frm&qw=&ctrlname=&firstframeh=30&thirdframeh='+botf+'&fifthframe=&docblank='+sBlankDocUrl+'&docblankform='+sBlankFormDocUrl+'&relaxedDomain=' + (sRelaxedDomain?sRelaxedDomain:'');
    if (sp_addurl){
        spwurl = addUrlParam( spwurl, 'sproxy_url', sp_addurl);
    }
    return spwurl;
}

function ChkFrm() {
    sp_doc=spellWin.frames[1].document;

    if(sp_doc) {
        var f_dst;

        f_dst=sp_doc.forms[0];
        f_dst.action=service_host+doc_process;
        if(sp_asce){
            f_dst.sp_asce.value=lang;
        }
        f_dst.cmd.value=cmd;
        f_dst.slang.value=lang;
        f_dst.intlang.value=intlang;
        f_dst.text.value=getSourceObjectContent(ctrlObj,false);
        /*SFDC
        /
        / This is SFDC specific change to ensure that for
        / simple text '<' and '>' are interpreted correctly
        /
        / SFDC
        */
        if (window.handleSpellWindowOnLoad){
            handleSpellWindowOnLoad(f_dst.text);
        }
        f_dst.trg_url.value=url;
        f_dst.trg_wnd.value=wndname;
        f_dst.txt_ctrl.value=force_reload?ctrlName:'';
        f_dst.svc_time.value=(new Date()).getTime();
        f_dst.customerid.value=customerid?customerid:'';
        f_dst.cust_dic_ids.value=cust_dic_ids?cust_dic_ids:'';
        f_dst.udn.value=udn?udn:'';

        f_dst.schema_url.value=schema_url;
        f_dst.schema.value=schema;
        f_dst.spp_langs.value=spp_langs;
    /*~	f_dst.hide.value=hide;*/
        
        f_dst.hide.value=autoClose;
        f_dst.settings.value=(isProxyVer)?("sproxy"):("sproxy=0");
        if(f_dst.ssrv_host){
            f_dst.ssrv_host.value=ssrv_host;
        }
        f_dst.relaxedDomain.value = sRelaxedDomain;
        /*SFDC
         * f_dst.referrer is inexplicably undefined on blitz.
         * Not setting it does not seem to have impact, so skip if undefined
         * W-2021288
         */
        if (f_dst.referer) {
            f_dst.referer.value = sReferer;
        }
        f_dst.submit();
    }
    is_window_opened=true;
}

function getWindowURL(){
    var sUrl = doc_initialize;
    sUrl = addUrlParam(sUrl,"relaxedDomain",sRelaxedDomain);
    return sUrl;
}

function addUrlParam(sUrl,sParam,sValue){
    return sUrl + ((/\?/).test(sUrl)?("&"):("?")) + sParam+ "=" + sValue;
}

/*
 * SFDC: W-2032235
 * Since the Spellchecker supports more browser versions than Salesforce does,
 * don't bother checking the browser version.
 */
//function isAppVer(s){
//    return navigator.appVersion.indexOf(s)!=-1;
//}


//# callback method invoker
function endSpellCheckCallback(sExitType,sCtrlId,sCheckedContent){
    var mCtrl = null;
    if(isCallbackInvokedInSession == true){
        return;
    }
    isCallbackInvokedInSession = true;
    if(sCtrlId == "MTBDummy"){
        mCtrl = pChecker.getCtrls();
    }else{
        mCtrl = document.getElementById(sCtrlId);
    }
    switch(sExitType){
        case "cancel":
            if(typeof(onCancel) == 'function'){
                onCancel(mCtrl);
            }
        break;
        case "close":
            if(typeof(onClose) == 'function'){
                onClose(mCtrl);
            }
        break;
        case "finish":
            if(sCtrlId == "MTBDummy"){
                pChecker.restore(sCheckedContent);
            }else{
                setSourceObjectContent(mCtrl,sCheckedContent);
            }
            if(typeof(tinyMCE) == 'object'){
                if(tinyMCE.activeEditor.plugins.scayt && tinyMCE.activeEditor.plugins.scayt._s._SCAYT_control){
                    tinyMCE.activeEditor.plugins.scayt._s._SCAYT_control.refresh();
                }
            }
            if(typeof(onFinish) == 'function'){
                onFinish(mCtrl);
            }
        break;
    }
}


//#get node content
function getSourceObjectContent(nObject,isText){
    var sContent = '';
    var nCtrl = null;
    if(nObject.value)
    {
        sContent = nObject.value;
    } else if(nObject.contentWindow)
    {
        nCtrl = nObject.contentWindow.document.body;
    } else if (nObject.contentEditable &&
        (nObject.tagName == "SPAN" ||
        nObject.tagName == "DIV"))
    {
        nCtrl = nObject;
    }
    if (nCtrl) {
        if(isText){
            sContent = nCtrl.innerText ||
            nCtrl.textContent ||
            "";
        }else{
            sContent = nCtrl.innerHTML;
        }
    }
    return sContent;
}
//# set Source object content
function setSourceObjectContent(nObject,sContent){
    if(nObject.value){
    	/*
    	 * SFDC: Decode text we get back from the Spellchecker
    	 * because we initially encoded it to handle <, >, &lt; and &gt;
    	 * This only needs to happen when text is copied back into simple
    	 * text fields because it was essentially HTML-encoded
    	 */
        nObject.value = handleDecodeText(sContent);
    }else if(nObject.contentWindow){
        nObject.contentWindow.document.body.innerHTML = sContent;
    } else if (nObject.contentEditable &&
        (nObject.tagName == "SPAN" ||
        nObject.tagName == "DIV"))
    {
        nObject.innerHTML = sContent;
    }
    return;
}

//#convert incoming string to identifier valid format: knife.domain.com:8080 => knife_domain_com_8080
function createIdentifier(sValue){
    return sValue.replace(/(\.|\-|\:)/img,'_');
}
//multiple instances  addon

/////////////////////////////////////////////////////////////////////////////////////////
var pChecker = null;
function MTB_I_Make_RegExp(strName)
{
    return new RegExp(strName.replace(/%/g, '\\x').replace(/\+/g, ' ').replace(/\*/g, '\\*').replace(/\[/g, '\\[').replace(/\]/g, '\\]'), '');
}

function MTB_I_EscapeText(strSrc)
{
    return strSrc.replace(/&/g,'&amp;').replace(/</g,'&lt;');
}

function MTB_I_UnescapeText(strSrc)
{
    return strSrc.replace(/&lt;/g, '<').replace(/&amp;/g, '&');
}
/////////////////////////////////////////////////////////////////////////////////////////
function MTB_I_StdAction(strText)
{
    this.obj.restore(strText);
}
function MTB_I_DummyObj()
{
    this.value	= '';
    this.name	= 'MTB_Dummy.action(this.document.forms[0].msg_body.value), parent.opener.MTB_Dummy';
    this.obj	= null;
    this.id = 'MTBDummy';
}
MTB_I_DummyObj.prototype.action	= MTB_I_StdAction;
var MTB_Dummy	= new MTB_I_DummyObj();
/////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////
function MTB_I_Compose_Text(bSimple){

    var	strResult;
    var i,j;
    var count	= 0;

    if (bSimple){
        strResult	= '';
    }else{
        strResult	= this.m_strBegin;
    }
    //var items = this.m_strNames.split(',');
   // var s = ''; s1 = '';
    var i, j;
    var items = this.m_strNames;
    for (i = 0; i < items.length; i++)
    {
        //var ctrl = eval(items[i]);
        var s_ctrl = items[i];
        var nObj = document.getElementById(items[i]);
        if(!nObj){
            continue;
        }
        var s_val = getSourceObjectContent(nObj,false);

        if (!bSimple)
            strResult   += this.m_strRBegin + '_x_path="' + s_ctrl + '"' + this.m_strRMiddle;
        strResult       += s_val;
        if (!bSimple)   
            strResult   += this.m_strREnd;
        else
            strResult   += this.m_strSDiv;
        count++;
        
        //s += items[i] + "\n";
    }

    if (!bSimple){
        strResult   += this.m_strEnd;
    }

    return strResult;
}
/////////////////////////////////////////////////////////////////////////////////////////
function MTB_I_Restore(strValue)
{
    var aE  = MTB_I_UnescapeText(strValue).split(this.m_strSplitter);
    var i;
    var sPath;
    var nBeg,nEnd;
    
    for (i = 0; i < aE.length - 1; i++)
    {
        nBeg                = aE[i].indexOf('_x_path="') + '_x_path="'.length;
        nEnd                = aE[i].indexOf('"' + this.m_strRMiddle, nBeg);
        sPath               = aE[i].substring(nBeg, nEnd);

        setSourceObjectContent(document.getElementById(sPath),aE[i].substring(nEnd + this.m_strRMiddle.length + 1, aE[i].length));

    }
}
/////////////////////////////////////////////////////////////////////////////////////////
function MTB_I_Check()
{
    MTB_Dummy.value     = this.compose(false);
    MTB_Dummy.obj       = this;

    if (MTB_Dummy.value == (this.m_strBegin + this.m_strEnd)){
        alert('Nothing to check');
    }else{
    
     // make copy of oparams,
        this.oParams.ctrl = MTB_Dummy;
//      spellCheckSingleInstance({ctrl:MTB_Dummy,lang:this.m_strLang,schemaIdentifier:this.m_strSch});
        spellCheckSingleInstance(this.oParams);
    }
}
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
function MTBChecker(oParams)
{
    this.m_strNames = oParams.ctrl;
//  this.m_strNames = strNames; oParams.ctrls;
//  this.m_strLang  = strLang;
//  this.m_strSch   = schemaIdentifier;
    this.oParams = oParams;
}

MTBChecker.prototype.check      = MTB_I_Check;
MTBChecker.prototype.compose    = MTB_I_Compose_Text;
MTBChecker.prototype.restore    = MTB_I_Restore;
MTBChecker.prototype.getCtrls = function(){
    var ctrls = new Array();
    for(var i=0; i<this.m_strNames.length;i++){
        ctrls.push(document.getElementById(this.m_strNames[i]));
    }
    return ctrls;
}

MTBChecker.prototype.m_strBegin     = '<table border=1 _bordercolor=silver width=100%>';
MTBChecker.prototype.m_strEnd       = '</table>';
MTBChecker.prototype.m_strRBegin    = '<TR tr_x_tr><TD ';
MTBChecker.prototype.m_strRMiddle   = '>';
MTBChecker.prototype.m_strREnd      = '</TD tr_x_tr></TR tr_x_tr>';
MTBChecker.prototype.m_strSplitter  = "</TD tr_x_tr></TR tr_x_tr>";
MTBChecker.prototype.m_strSDiv      = '\n\n';

MTBChecker.prototype.m_strDoc           = 'document';
MTBChecker.prototype.m_strCollection    = 'forms';
MTBChecker.prototype.m_strSubCollection = 'elements';
MTBChecker.prototype.m_strTypes         = 'text,textarea';

MTBChecker.prototype.m_objSubmitForm = "";

function spellCheckMultipleInstances(oParams){
    pChecker    = new MTBChecker(oParams);
    pChecker.check();
}
function getCtrlName(){
    return ctrlName;
}
/*SFDC
/
/ This is SFDC specific change to ensure that for
/ simple text '<', '>', '&lt;' and '&gt;' are interpreted correctly
/
/ SFDC
*/

function handleSpellWindowOnLoad(objectToChange){
    objectToChange.value = objectToChange.value.replace(/&/g, "&amp;");
    objectToChange.value = objectToChange.value.replace(/</g,"&lt;");
    objectToChange.value = objectToChange.value.replace(/>/g,"&gt;");
}
function handleDecodeText(str) {
	return str.replace(/&gt;/g, ">").replace(/&lt;/g, "<").replace(/&amp;/g, "&");
}
/*    return { 
        doSpell : doSpell,
        initWSCFrames: initWSCFrames,
        ChkFrm: ChkFrm,
        endSpellCheckCallback: endSpellCheckCallback,
        getCtrlName: getCtrlName
    };
})();
doSpell = WSC.doSpell; */