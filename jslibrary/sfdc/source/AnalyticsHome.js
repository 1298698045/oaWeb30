Ext.namespace("sfdc.analytics.framework");
sfdc.analytics.framework.EntityDeleter=function(b,a,d){
    this.url=UserContext.getUrl("/_ui/analytics/reporting/ui/home/DeleterServlet");
    this.id=b;
    this.csrf=a;
    this.onSuccess=d
};
sfdc.analytics.framework.EntityDeleter.prototype={
    deleteEntity: function(){
        varb={
            id: this.id
        };b[
            CSRFConstants.CSRF_TOKEN
        ]=this.csrf;Sfdc.Ajax.post(this.url,
        this._handleDeleteResponse.createDelegate(this),
        {
            data: b,
            escape: encodeURIComponent
        })
    },
    _handleDeleteResponse: function(b){
        vara;try{
            a=Util.evalAjaxServletOutput(b)
        }catch(d){
            window.location.reload()
        }if(a.success)this.onSuccess(a);elseif(a.errors){
            varc=[
                
            ];Ext.each(a.errors,
            function(a){
                c.push(a.msg);a.relatedItems&&c.push("\x3cbr/\x3e\x3cbr/\x3e"+a.relatedItems)
            });sfdc.analytics.framework.WARNING(a.errorTitle,
            c.join(""),
            !0,
            600)
        }
    }
};
Ext.override(Ext.form.ComboBox,
{
    initList: function(){
        if(!this.list){
            this.list=newExt.Layer({
                parentEl: this.getListParent(),
                shadow: this.shadow,
                cls: [
                    "x-combo-list",
                    this.listClass
                ].join(" "),
                constrain: !1
            });this.innerList=this.list.createChild({
                cls: "x-combo-list-inner"
            });this.mon(this.innerList,
            "mouseover",
            this.onViewOver,
            this);this.mon(this.innerList,
            "mousemove",
            this.onViewMove,
            this);this.pageSize&&(this.footer=this.list.createChild({
                cls: "x-combo-list-ft"
            }),
            this.pageTb=newExt.PagingToolbar({
                store: this.store,
                pageSize: this.pageSize,
                renderTo: this.footer
            }),
            this.assetHeight+=this.footer.getHeight());this.tpl||(this.tpl='\x3ctplfor\x3d"."\x3e\x3cdivclass\x3d"x-combo-list-item"\x3e{'+this.displayField+":htmlEncode}\x3c/div\x3e\x3c/tpl\x3e");
            this.view=newExt.DataView({
                    applyTo: this.innerList,
                    tpl: this.tpl,
                    singleSelect: !0,
                    selectedClass: this.selectedClass,
                    itemSelector: this.itemSelector||".x-combo-list-item",
                    emptyText: this.listEmptyText
            });this.mon(this.view,"click",this.onViewClick,this);
            this.bindStore(this.store,!0);vara;
            if(!Ext.isDefined(this.dontOverrideListWidth))if(Ext.isDefined(this.resizable)||"auto"===this.listWidth){
                    if(a=this._setAutoWidth(),
                    "auto"===this.listWidth&&this.store)this.store.on({
                        scope: this,
                        load: this._setAutoWidth
                    })
                }elsethis.listWidth&&(a=this.listWidth||Math.max(this.wrap.getWidth(),
                this.minListWidth),
                this.list.setSize(a,0));
                this.list.swallowEvent("mousewheel");this.assetHeight=0;!1!==this.syncFont&&this.list.setStyle("font-size",
                this.el.getStyle("font-size"));this.title&&(this.header=this.list.createChild({
                    cls: "x-combo-list-hd",
                    html: this.title
                }),
                this.assetHeight+=this.header.getHeight());this.innerList.setWidth(a-this.list.getFrameWidth("lr"));this.resizable&&(this.resizer=newExt.Resizable(this.list,
                {
                    pinned: !0,
                    handles: "se"
                }),
                this.mon(this.resizer,
                "resize",
                function(a,
                c,
                d){
                    this.maxHeight=d-this.handleHeight-this.list.getFrameWidth("tb")-this.assetHeight;this.listWidth=c;this.innerList.setWidth(c-this.list.getFrameWidth("lr"));this.restrictHeight()
                },
                this),
                this[
                    this.pageSize?"footer": "innerList"
                ].setStyle("margin-bottom",
                this.handleHeight+"px"))
            }
        },
        _setAutoWidth: function(){
            Ext.fly(this.list.id).dom.style.width="";Ext.fly(this.innerList.id).dom.style.width="";vara=0;Ext.isIE?(this.innerList.addClass("list-auto-width-IE"),
            a=this.list.getBox(),
            this.innerList.removeClass("list-auto-width-IE")): a=this.list.getBox();a=Math.max(this.wrap.getWidth(),
            a.width)+(this.list.getHeight()>this.maxHeight?15: 0);this.list.setSize(a,
            0);this.innerList.setWidth(a);returna
        },
        beforeBlur: function(){
            vara=this.getRawValue(),
            b;this.valueField&&Ext.isDefined(this.value)&&(b=this.findRecord(this.valueField,
            this.value));if(!b||b.get(this.displayField)!=a)b=this.findRecord(this.displayField,
            a);if(!b&&this.forceSelection)0<a.length&&a!=this.emptyText?(this.el.dom.value=Ext.value(this.lastSelectionText,
            ""),
            this.applyEmptyText()): this.clearValue();else{
                if(b&&this.valueField&&(a=b.get(this.valueField),
                this.value==a))return;this.setValue(a)
            }
        },
        onKeyUp: function(a){
            varb=a.getKey();if(!1!==this.editable&&!0!==this.readOnly&&(b==a.BACKSPACE||b==a.DELETE||!a.isSpecialKey()))this.lastKey=b,
            this.dqTask.delay(this.queryDelay);Ext.form.ComboBox.superclass.onKeyUp.call(this,
            a)
        }
    });Ext.override(Ext.form.Field,
    {
        markInvalid: function(a){
            a=LC.getLabel("AnalyticsDialog",
            "error",
            a);if(this.rendered&&!this.preventMark){
                a=a||this.invalidText;varb=this.getMessageHandler();if(b)b.mark(this,
                a);elseif(this.msgTarget&&(this.el.addClass(this.invalidClass),
                b=Ext.getDom(this.msgTarget)))b.innerHTML=a,
                b.style.display=this.msgDisplay;this.activeError=a;this.fireEvent("invalid",
                this,
                a)
            }
        }
    });Ext.override(Ext.form.NumberField,
    {
        processValue: function(a){
            returnExt.form.NumberField.superclass.processValue.call(this,
            Ext.util.Format.htmlEncode(a))
        }
    });Ext.override(Ext.form.DateField,
    {
        onMenuHide: function(){
            this.focus();this.focus(!1,
            60);this.menuEvents("un")
        }
    });Ext.override(Ext.menu.DateMenu,
    {
        initComponent: function(){
            this.on("beforeshow",
            this.onBeforeShow,
            this);if(this.strict=Ext.isIE7&&Ext.isStrict)this.on("show",
            this.onShow,
            this,
            {
                single: !0,
                delay: 20
            });Ext.apply(this,
            {
                plain: !0,
                showSeparator: !1,
                items: this.picker=newExt.DatePicker(Ext.apply({
                    internalRender: this.strict||!Ext.isIE,
                    ctCls: "x-menu-date-item"
                },
                this.initialConfig))
            });this.picker.purgeListeners();this.relayEvents(this.picker,
            [
                "select"
            ]);this.on("show",
            this.picker.focus,
            this.picker);Ext.menu.DateMenu.superclass.initComponent.call(this)
        }
    });Ext.override(Ext.Component,
    {
        onShow: function(){
            this.getVisibilityEl().removeClass("x-hide-"+this.hideMode);Ext.isWebKit&&this.getVisibilityEl().show()
        }
    });Ext.override(Ext.Element,
    {
        setOpacity: function(a,
        b){
            varc=this.dom.style;if(!b||!this.anim){
                vard="undefined"!=typeofdocument.createElement("div").style.opacity;if(Ext.isIE&&!d){
                    vard=1>a?"alpha(opacity\x3d"+100*a+")": "",
                    e=c.filter.replace(/alpha\(opacity=(.*)\)/i,
                    "").replace(/^\s+|\s+$/g,
                    "");c.zoom=1;c.filter=e+(0<e.length?" ": "")+d
                }elsec.opacity=a
            }elsethis.anim({
                opacity: {
                    to: a
                }
            },
            this.preanim(arguments,
            1),
            null,
            0.35,
            "easeIn");returnthis
        }
    });Ext.dd.DragDropMgr.getLocation=function(a){
        if(!this.isTypeOfDD(a))returnnull;varb=a.getEl(),
        c,
        d,
        e;try{
            c=Ext.lib.Dom.getXY(b)
        }catch(f){
            
        }if(!c)returnnull;d=c[
            0
        ];e=d+b.offsetWidth;c=c[
            1
        ];returnnewExt.lib.Region(c-a.padding[
            0
        ],
        e+a.padding[
            1
        ],
        c+b.offsetHeight+a.padding[
            2
        ],
        d-a.padding[
            3
        ])
    };Ext.namespace("sfdc.analytics.framework");sfdc.analytics.framework.CONFIRM=function(a,
    b,
    c,
    d,
    e){
        Ext.Msg.show({
            title: a,
            cls: "confirm_dialog",
            msg: b,
            buttons: {
                yes: LC.getLabel("Buttons",
                "yes"),
                no: LC.getLabel("Buttons",
                "no")
            },
            fn: function(a){
                "yes"==a?d(): "no"==a&&Ext.isDefined(e)&&e()
            },
            modal: c,
            width: 330
        });returnthis
    };sfdc.analytics.framework.WARNING=function(a,
    b,
    c,
    d){
        Ext.Msg.show({
            title: a,
            cls: "warning_dialog",
            msg: b,
            buttons: {
                yes: LC.getLabel("Buttons",
                "ok")
            },
            modal: c,
            width: d||330
        });returnthis
    };
    sfdc.analytics.framework.SAVE_AND_CLOSE=function(a,
    b,
    c,
    d){
        returnExt.Msg.show({
            title: a,
            cls: "save_and_close_dialog",
            msg: b,
            buttons: {
                yes: LC.getLabel("Buttons",
                "save_and_close"),
                no: LC.getLabel("Buttons",
                "close"),
                cancel: LC.getLabel("Buttons",
                "cancel")
            },
            fn: function(a){
                "yes"==a?c(): "no"==a&&d()
            },
            modal: !0,
            width: 600
        })
    };
    Ext.namespace("sfdc.analytics.framework");