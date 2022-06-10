function picklistSetup() {}

// config 
picklistSetup.chunkSize = 5;
picklistSetup.vchunk = 20;
picklistSetup.height = "40em";
//

picklistSetup.current = null;
picklistSetup.currentTarget = null;
picklistSetup.currentColumn = null;
picklistSetup.lastSearched = null;
picklistSetup.selection = {};
picklistSetup.mouseDown = false;
picklistSetup.findShown = false;
picklistSetup.markedColumn = null;

picklistSetup.init = function() 
{
	// create those once, as it is expensive
	this.bitsets = [];
	var bitset;
	var el;
	for( var i=0;i<this.cols;i++ ) {
		el = document.getElementById("inp_"+i);
		bitset = new Bitset(el.value);
		bitset.docElem = el;
		this.bitsets.push(bitset);
	}
	this.showColumns(0);
}

picklistSetup.preview = function()
{
     openPopup(this.previewUrl,'preview', 600, 250, 'width=600,height=250,location=no,dependent=no,resizable=yes,toolbar=no,status=yes,directories=no,menubar=no,scrollbars=1',true);
       	
}
picklistSetup.handleMouseDown = function(ev)
{
	this.clearTextSelection();
}

picklistSetup.handleMouseUp = function(ev)
{
	if(!ev.ctrlKey && !this.mouseDown) {
		this.clearSelection();
	}
	this.mouseDown = false;
	this.clearTextSelection();
}

picklistSetup.handleMouseMove = function(ev,el)
{
	if(this.mouseDown && el != this.currentTarget) {
		this.currentTarget = el;
		this.clearTextSelection();
		if( !ev.ctrlKey )
			this.clearSelection();
		this.selectRange(el,this.current);
	}
}

picklistSetup.clearSelection = function() 
{
   for(var x in this.selection) {
       this.selection[x].className = this.selection[x].className.replace(/selectedPickValue/,"");
   }
   if(this.markedColumn) this.markColumn(this.markedColumn,false);
   this.selection = {};
}

picklistSetup.getTitle = function(row,col,sel)
{
	return (sel?this.selectedLabel:this.unselectedLabel)+": "+this.controlLabel+": "+this.controls[col];
}

picklistSetup.nextChunk = function()
{
	//var n = Math.min(this.currentColumn+this.chunkSize,this.cols-1);
	//n = Math.floor(n/this.chunkSize)*this.chunkSize;
	this.lastSearched = null;
	this.showColumns(Math.min(this.currentColumn+this.chunkSize,Math.max(this.cols,0)));
	//this.showColumns(n);
}
picklistSetup.previousChunk = function()
{
	//var n = Math.max(this.currentColumn-this.chunkSize,0);
	//n = Math.floor(n/this.chunkSize)*this.chunkSize;
	this.lastSearched = null;
	this.showColumns(Math.max(this.currentColumn-this.chunkSize,0));
	//this.showColumns(n);
}

picklistSetup.toggleFind = function()
{
	this.findShown^=true;
	document.getElementById("findDialog").style.display = this.findShown?"":"none";
	document.getElementById("findSwitch").firstChild.src = this.findShown?this.hideTwisty:this.showTwisty;
}

picklistSetup.find = function(n)
{
	this.clearSelection();
	this.lastSearched=n;
	this.showColumns(n);
	if(this.markedColumn) this.markColumn(this.markedColumn,false);
	this.markColumn(n,true);
}

picklistSetup.addHeader = function(w,startCol,endCol,all)
{
    w.push("<tr><td class=\""+(all?"navigationHeaderAll":"navigationHeaderNormal")+"\">");
    w.push(formatMessage(this.showLabel,startCol+1,endCol,this.cols));
    if(all) {
	    w.push("&nbsp;&nbsp;&nbsp;<a href=\"javascript:picklistSetup.showColumns(0)\">&nbsp;"+formatMessage(this.normalLabel,this.chunkSize)+"&nbsp;</a>&nbsp;");
	} else {
		w.push("&nbsp;");
		if(startCol > 0)
			w.push("<a href=\"javascript:picklistSetup.previousChunk()\">"+this.previousLabel+"</a>");
		else
			w.push(this.previousLabel);
		w.push("&nbsp;|&nbsp;");
    	if(endCol < this.cols)
    		w.push("<a href=\"javascript:picklistSetup.nextChunk()\">"+this.nextLabel+"</a>");
    	else
    		w.push(this.nextLabel);    	
    	w.push("&nbsp;&nbsp;&nbsp;");
    	if(this.rows*this.cols<=this.maxCells) {
    		w.push("<a href=\"javascript:picklistSetup.showColumns(-1)\">&nbsp;"+this.allLabel+"&nbsp;</a>&nbsp;");
    	} else {
    		w.push("<a href=\"javascript:alert('"+this.tooManyLabel+"')\">&nbsp;"+this.allLabel+"&nbsp;</a>&nbsp;");
    	}
	}
    
}
picklistSetup.saveOk = function()
{
	var n = 0;
	for( var i=0;i<this.cols;i++ )
		if( this.bitsets[i].length()==0) n++;

	if(n>0)
		return confirm(formatMessage(this.saveMsg,n));
	else
		return true;
}
picklistSetup.addHeaderRow = function(w,startCol,endCol,width,n)
{
    w.push("<tr><th class=\"topSelectHeader\""); w.push(" width=\""+width/2+"%\"" );
    w.push(">&nbsp;"+Sfdc.String.escapeToHtml(this.controlLabel)+":&nbsp;");
	var c = " width=\""+width+"%\"";
	for( var i=startCol;i<endCol;i++ ) {
    	w.push("<th id=\"th_r"+Math.floor(n/this.vchunk)+"c"+i+"\" class=\"selectHeader\" onClick=\"picklistSetup.selectColumn("+i+")\"");
    	w.push(c);
    	w.push(">&nbsp;");w.push(this.controls[i]);w.push("&nbsp;</div>");
    }
	w.push("<tr><th class=\"topSelectHeader\" rowspan=\""+Math.max(Math.min(this.deps.length-n,this.vchunk),0)+"\">&nbsp;"+Sfdc.String.escapeToHtml(this.depLabel)+":&nbsp;");
}


picklistSetup.showColumns = function(n)
{
	var n = parseInt(n);
	var all = (n==-1);

	var w = [];
	var startCol = (n==-1?0:Math.floor(n/this.chunkSize)*this.chunkSize);
    this.selection = {};

	var endCol = (n==-1?this.cols:Math.min(this.cols,startCol+this.chunkSize));
	var width = Math.floor(100/(endCol-startCol+1));
	
	w.push("<table cellpadding=\"0\" cellspacing=\"0\" style=\"width:99.8%\">");
    this.addHeader(w,startCol,endCol,all);
	if(!all) {
    	w.push("&nbsp;&nbsp;&nbsp;");
    	w.push("<a alt='"+this.findColumnLabel+"' id=\"findSwitch\" href=\"javascript:picklistSetup.toggleFind()\"><img border=\"0\" alt='"+this.findColumnLabel+"' src=\""+(this.findShown?this.hideTwisty:this.showTwisty)+"\">");
   		w.push(this.findLabel);
    	w.push("</a>");
	    w.push("<tr><td style=\"display:"+(this.findShown?"":"none")+"\" id=\"findDialog\" nowrap align=\"right\" colspan=\"all\">");
	    w.push(this.findColumnLabel+"<select onChange=\"picklistSetup.find(this.value);\" value=\"-1\">");
		if(!this.lastSearched) w.push("<option value=\"\">");
	    for(var i=0;i<this.cols;i++) {
	        w.push("<option value=\""+i+"\""+(this.lastSearched==i?"selected":"")+">"+this.controls[i]);
	    }
	    w.push("</select>");
	}
	w.push("</table>");
	w.push("<div "); if(this.rows>this.vchunk) w.push("style=\"height:"+this.height+";overflow:auto\"");
	w.push(">");
	// width 99...% to fix mozilla bug where it renders a horizontal scrollbar
    w.push("<table id=\"matrix\" cellpadding=\"0\" cellspacing=\"0\" onMouseUp=\"picklistSetup.handleMouseUp(event)\" onMouseDown=\"picklistSetup.handleMouseDown(event)\""); if(!all) w.push(" style=\"width:99.8%\"");
    w.push(">");
	var first = true;

	// pre-create common substrings
    var c1 = "\" onMouseDown=\"picklistSetup.handleClick(event,this)\" onDblClick=\"picklistSetup.handleDblClick(event,this)\" onMouseMove=\"picklistSetup.handleMouseMove(event,this)\">";
    var c2 = "&nbsp;";
    var c3 = ": ";
    var c4 = "shownPickValue\" title=\"";
    var c5 = "hiddenPickValue\" title=\"";
	for( var i=0;i<this.rows;i++ ) {
        if(i%this.vchunk==0) { this.addHeaderRow(w,startCol,endCol,width,i); }
	    else w.push("<tr>");
		for( var j=startCol;j<endCol;j++ ) {
			w.push("<td id=\"te_r"+i+"c"+j+"\" class=\"");
			if(this.bitsets[j].testBit(i)) {
            	w.push(c4); w.push(this.selectedLabel);
			} else {
                w.push(c5); w.push(this.unselectedLabel);
			}
			w.push(c3);w.push(Sfdc.String.escapeToHtml(this.controlLabel));w.push(c3);w.push(this.controls[j]);
            w.push(c1);
            w.push(c2);w.push(this.deps[i]);w.push(c2);
		}
	}
	w.push("</table>");
	w.push("</div>");
	w.push("<table cellpadding=\"0\" cellspacing=\"0\" style=\"width:99.8%\">");
    this.addHeader(w,startCol,endCol,all);
	w.push("</table>");
	var anchor = document.getElementById("matrixAnchor");

	anchor.innerHTML = w.join('');
	
	if(all) {
		anchor.className="anchorAll";
	} else {
		anchor.className="anchorStd";
	}
	
	this.currentColumn = startCol;
}

picklistSetup.selectColumn = function(n)
{
	this.markSelected(0,n,this.rows-1,n);
}

picklistSetup.markColumn = function(n,mark) {
	this.markedColumn = mark?n:null;
	var i = 0;
	var obj;
	while((obj=document.getElementById("th_r"+(i++)+"c"+n))!=null) {
		if(mark) {
	    	if(obj.className.indexOf("markedColumn")==-1)
		    	obj.className += " markedColumn";
		} else {
			obj.className = obj.className.replace(/markedColumn/,"");
		}
	}
}

picklistSetup.selectRange = function(e1,e2)
{
	var r1 = this.getRowNum(e1);
	var r2 = this.getRowNum(e2);
	var c1 = this.getColNum(e1);
	var c2 = this.getColNum(e2);
	this.markSelected(r1,c1,r2,c2);
}

picklistSetup.markSelected = function(r1,c1,r2,c2)
{
	var startRow = Math.min(r1,r2);
	var endRow = Math.max(r1,r2);
	var startCol = Math.min(c1,c2);
	var endCol = Math.max(c1,c2);
	for(var i=startRow;i<=endRow;i++) {
	    for(var j=startCol;j<=endCol;j++) {
	    	var obj = document.getElementById("te_r"+i+"c"+j);
	    	this.selection[obj.id]=obj;
	    	if(obj.className.indexOf("selectedPickValue")==-1)
		    	obj.className += " selectedPickValue";
	    }
	}
}

picklistSetup.handleClick = function(ev,el)
{
	this.clearTextSelection();
	this.mouseDown = true;

	if( ev.shiftKey )
	{
		this.clearSelection();

		this.selectRange(el,this.current);
	}
	else
	{
		this.current = el;
		if( ev.ctrlKey )
		{
			this.currentTarget = el;
			if(this.selection[el.id]) {
				delete(this.selection[el.id]);
		        el.className = el.className.replace(/selectedPickValue/,"");
			} else {
				this.selection[el.id]=el;
	    		el.className += " selectedPickValue";
			}
		}
		else
		{
			this.clearSelection();
			el.className += " selectedPickValue";
			this.selection[el.id]=el;
		}
	}
	this.clearTextSelection();
	if(ev.returnValue)
		ev.returnValue = false;
	else if(ev.preventDefault)
		ev.preventDefault();
	else 
		return false;
}

picklistSetup.handleDblClick = function(ev,el)
{
    //debugger;
	if(!this.isEditMode) return;
	this.clearTextSelection();

	var row = this.getRowNum(el);
	var col = this.getColNum(el);
	var s = this.bitsets[col];
	if(s.testBit(row)) {
		this.disable(el);
    } else {
    	this.enable(el);
	}
	this.clearSelection();
}

picklistSetup.enableAll = function()
{
  var any = false;
  for( var x in this.selection ) {
     any = true;
     this.enable(this.selection[x]);
  }
  if(!any)
    alert(this.pickOneLabel);
  else
	this.clearSelection();
}

picklistSetup.disableAll = function()
{
  var any = false;
  for( var x in this.selection ) {
     any = true;
     this.disable(this.selection[x]);
  }
  if(!any)
    alert(this.pickOneLabel);
  else
    this.clearSelection();
}

picklistSetup.enable = function(el)
{
   	el.className=el.className.replace(/shownPickValue|hiddenPickValue/,"shownPickValue");
	var row = this.getRowNum(el);
	var col = this.getColNum(el);
	el.title=this.getTitle(row,col,true);
	var s = this.bitsets[col];
	s.setBit(row);
	s.docElem.value = s;
}

picklistSetup.disable = function(el) 
{
   	el.className=el.className.replace(/shownPickValue|hiddenPickValue/,"hiddenPickValue");
	var row = this.getRowNum(el);
	var col = this.getColNum(el);
	el.title=this.getTitle(row,col,false);
	var s = this.bitsets[col];
	s.clearBit(row);
	s.docElem.value = s;
}
picklistSetup.getRowNum = function(obj) {
    return parseInt(obj.id.substring(obj.id.indexOf('r')+1, obj.id.indexOf('c')));
}
picklistSetup.getColNum = function(obj) {
    return parseInt(obj.id.substring(obj.id.indexOf('c')+1, obj.id.length));
}

picklistSetup.clearTextSelection = function(){
    if (isIE) {
        document.selection.empty(); 
    } else {
		if (window.getSelection().removeAllRanges)
	    	window.getSelection().removeAllRanges();
	}
}
