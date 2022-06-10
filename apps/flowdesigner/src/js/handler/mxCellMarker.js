/**
 * $Id: mxCellMarker.js,v 1.8 2008/10/10 11:56:25 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCellMarker
 * 
 * A helper class to process mouse locations and highlight cells.
 * 
 * Helper class to highlight cells.
 *
 * Event: mark
 * 
 * Fires after a cell has been marked. The first argument points to the source
 * <mxCellMarker>, the second argument points to the marked <mxCellState> or
 * null if no state has been marked.
 */
{

	/**
	 * Constructor: mxCellMarker
	 * 
	 * Constructs a new cell marker.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 * validColor - Optional marker color for valid states. Default is
	 * <mxConstants.DEFAULT_VALID_COLOR>.
	 * invalidColor - Optional marker color for invalid states. Default is
	 * <mxConstants.DEFAULT_INVALID_COLOR>.
	 * hotspot - Portion of the width and hight where a state intersects a
	 * given coordinate pair. A value of 0 means always highlight. Default is
	 * <mxConstants.DEFAULT_HOTSPOT>.
	 */
	function mxCellMarker(graph, validColor, invalidColor, hotspot)
	{
		if (graph != null)
		{
			this.graph = graph;
			this.validColor = (validColor != null) ? validColor : mxConstants.DEFAULT_VALID_COLOR;
			this.invalidColor = (validColor != null) ? invalidColor : mxConstants.DEFAULT_INVALID_COLOR;
			this.hotspot = (hotspot != null) ? hotspot : mxConstants.DEFAULT_HOTSPOT;
			
			var strokeWidth = mxConstants.HIGHLIGHT_STROKEWIDTH;
			
			this.shape = new mxRectangleShape(new mxRectangle(),
				null, this.validColor, strokeWidth);
			this.shape.dialect = (this.graph.dialect != mxConstants.DIALECT_SVG) ?
				mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
			this.shape.init(graph.getView().getOverlayPane());
			this.shape.node.style.background = '';
			this.shape.node.style.display = 'none';
	
			this.edgeShape = new mxPolyline([new mxPoint(), new mxPoint()],
				this.validColor, strokeWidth);
			this.edgeShape.dialect = (this.graph.dialect != mxConstants.DIALECT_SVG) ?
				mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
			this.edgeShape.init(graph.getView().getOverlayPane());
			this.edgeShape.node.style.display = 'none';
			
			// Event transparency for rectangular marker
			var self = this; // closure
			mxEvent.addListener(this.shape.node, 'mousedown', function (evt)
			{
				var cell = (self.markedState != null) ? self.markedState.cell : null;
				graph.dispatchGraphEvent('mousedown', evt, cell);
			});
			mxEvent.addListener(this.shape.node, 'mousemove', function (evt)
			{
				var cell = (self.markedState != null) ? self.markedState.cell : null;
				graph.dispatchGraphEvent('mousemove', evt, cell);
			});
			mxEvent.addListener(this.shape.node, 'mouseup', function (evt)
			{
				var cell = (self.markedState != null) ? self.markedState.cell : null;
				graph.dispatchGraphEvent('mouseup', evt, cell);
			});
			
			// Event transparency for edge marker
			mxEvent.addListener(this.edgeShape.node, 'mousedown', function (evt)
			{
				var cell = (self.markedState != null) ? self.markedState.cell : null;
				graph.dispatchGraphEvent('mousedown', evt, cell);
			});
			mxEvent.addListener(this.edgeShape.node, 'mousemove', function (evt)
			{
				var cell = (self.markedState != null) ? self.markedState.cell : null;
				graph.dispatchGraphEvent('mousemove', evt, cell);
			});
			mxEvent.addListener(this.edgeShape.node, 'mouseup', function (evt)
			{
				var cell = (self.markedState != null) ? self.markedState.cell : null;
				graph.dispatchGraphEvent('mouseup', evt, cell);
			});
			
			// Hides the marker if the graph changes
			this.resetHandler = function(sender)
			{
				self.reset();
			};
	
			this.graph.getView().addListener('scale', this.resetHandler);
			this.graph.getView().addListener('translate', this.resetHandler);
			this.graph.getView().addListener('scaleAndTranslate', this.resetHandler);
			this.graph.getView().addListener('down', this.resetHandler);
			this.graph.getView().addListener('up', this.resetHandler);
			this.graph.getModel().addListener('change', this.resetHandler);
		}
	};

	/**
	 * Extends mxEventSource.
	 */
	mxCellMarker.prototype = new mxEventSource();
	mxCellMarker.prototype.constructor = mxCellMarker;

	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxCellMarker.prototype.graph = null;

	/**
	 * Variable: enabled
	 * 
	 * Specifies if the marker is enabled. Default is true.
	 */
	mxCellMarker.prototype.enabled = true;

	/**
	 * Variable: hotspot
	 * 
	 * Specifies the portion of the width and height that should trigger
	 * a highlight. The area around the center of the cell to be marked is used
	 * as the hotspot. Possible values are between 0 and 1. Default is
	 * mxConstants.DEFAULT_HOTSPOT.
	 */
	mxCellMarker.prototype.hotspot = mxConstants.DEFAULT_HOTSPOT; 

	/**
	 * Variable: hotspotEnabled
	 * 
	 * Specifies if the hotspot is enabled. Default is false.
	 */
	mxCellMarker.prototype.hotspotEnabled = false;

	/**
	 * Variable: validColor
	 * 
	 * Holds the valid marker color.
	 */
	mxCellMarker.prototype.validColor = null;

	/**
	 * Variable: invalidColor
	 * 
	 * Holds the invalid marker color.
	 */
	mxCellMarker.prototype.invalidColor = null;

	/**
	 * Variable: currentColor
	 * 
	 * Holds the current marker color.
	 */
	mxCellMarker.prototype.currentColor = null;

	/**
	 * Variable: validState
	 * 
	 * Holds the marked <mxCellState> if it is valid.
	 */
	mxCellMarker.prototype.validState = null; 

	/**
	 * Variable: markedState
	 * 
	 * Holds the marked <mxCellState>.
	 */
	mxCellMarker.prototype.markedState = null; 
	
	/**
	 * Function: resetHandler
	 * 
	 * Stores a reference to the function that resets the marker if the view
	 * or model changes. This is required to remove the listener in <destroy>.
	 */
	 mxCellMarker.prototype.resetHandler = null;

	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling. This implementation
	 * updates <enabled>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean that specifies the new enabled state.
	 */
	mxCellMarker.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};

	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxCellMarker.prototype.isEnabled = function()
	{
		return this.enabled;
	};

	/**
	 * Function: setHotspot
	 * 
	 * Sets the <hotspot>.
	 */
	mxCellMarker.prototype.setHotspot = function(hotspot)
	{
		this.hotspot = hotspot;
	};

	/**
	 * Function: getHotspot
	 * 
	 * Returns the <hotspot>.
	 */
	mxCellMarker.prototype.getHotspot = function()
	{
		return this.hotspot;
	};

	/**
	 * Function: setHotspotEnabled
	 * 
	 * Specifies whether the hotspot should be used in <intersects>.
	 */
	mxCellMarker.prototype.setHotspotEnabled = function(enabled)
	{
		this.hotspotEnabled = enabled;
	};

	/**
	 * Function: isHotspotEnabled
	 * 
	 * Returns true if hotspot is used in <intersects>.
	 */
	mxCellMarker.prototype.isHotspotEnabled = function()
	{
		return this.hotspotEnabled;
	};

	/**
	 * Function: hasValidState
	 * 
	 * Returns true if <validState> is not null.
	 */
	mxCellMarker.prototype.hasValidState = function()
	{
		return this.validState != null;
	};
	
	/**
	 * Function: getValidState
	 * 
	 * Returns the <validState>.
	 */
	mxCellMarker.prototype.getValidState = function()
	{
		return this.validState;
	};
	
	/**
	 * Function: getMarkedState
	 * 
	 * Returns the <markedState>.
	 */
	mxCellMarker.prototype.getMarkedState = function()
	{
		return this.markedState;
	};
	
	/**
	 * Function: reset
	 * 
	 * Resets the state of the cell marker.
	 */
	mxCellMarker.prototype.reset = function()
	{
		this.validState = null;
		
		if (this.markedState != null)
		{
			this.markedState = null;
			this.unmark();
		}
	};
	
	/**
	 * Function: process
	 * 
	 * Processes the given event and cell and marks the state returned by
	 * <getState> with the color returned by <getMarkerColor>. If the
	 * markerColor is not null, then the state is stored in <markedState>. If
	 * <isValidState> returns true, then the state is stored in <validState>
	 * regardless of the marker color. The state is returned regardless of the
	 * marker color and valid state. 
	 */
	mxCellMarker.prototype.process = function(evt, cell)
	{
		var state = null;
		
		if (this.isEnabled())
		{
			state = this.getState(evt, cell);
			var isValid = (state != null) ? this.isValidState(state) : false;
			var color = this.getMarkerColor(evt, state, isValid);
			
			if (isValid)
			{
				this.validState = state;
			}
			else
			{
				this.validState = null;
			}
			
			if (state != this.markedState ||
				color != this.currentColor)
			{
				this.currentColor = color;
				
				if (state != null &&
					this.currentColor != null)
				{
					this.markedState = state;
					this.mark();		
				}
				else if (this.markedState != null)
				{
					this.markedState = null;
					this.unmark();
				}
			}
		}
		
		return state;
	};

	/**
	 * Function: mark
	 * 
	 * Marks the <markedState> and fires a <mark> event.
	 */
	mxCellMarker.prototype.mark = function()
	{
		if (this.markedState != null)
		{
			var shape = null;
			
			if (this.graph.model.isEdge(this.markedState.cell))
			{
				shape = this.edgeShape;
				shape.points = this.markedState.absolutePoints;
				this.shape.node.style.display = 'none';
			}
			else
			{
				shape = this.shape;
				shape.bounds = new mxRectangle(
						this.markedState.x-2, this.markedState.y-2,
						this.markedState.width+4, this.markedState.height+4);
				this.edgeShape.node.style.display = 'none';
			}

			shape.node.style.display = 'inline';
			shape.redraw();
			
			if (shape.dialect == mxConstants.DIALECT_SVG)
			{
				shape.innerNode.setAttribute('stroke', this.currentColor);
			}
			else
			{
				shape.node.setAttribute('strokecolor', this.currentColor);
			}

			this.dispatchEvent('mark', this, this.markedState);
		}
	};
	
	/**
	 * Function: unmark
	 * 
	 * Hides the marker and fires a <mark> event.
	 */
	mxCellMarker.prototype.unmark = function()
	{
		this.edgeShape.node.style.display = 'none';
		this.shape.node.style.display = 'none';
		this.dispatchEvent('mark', this);
	};

	/**
	 * Function: isValidState
	 * 
	 * Returns true if the given <mxCellState> is a valid state. If this
	 * returns true, then the state is stored in <validState>. The return value
	 * of this method is used as the argument for <getMarkerColor>.
	 */
	mxCellMarker.prototype.isValidState = function(state)
	{
		return true;
	};
	
	/**
	 * Function: getMarkerColor
	 * 
	 * Returns the valid- or invalidColor depending on the value of isValid.
	 * The given <mxCellState> is ignored by this implementation.
	 */
	mxCellMarker.prototype.getMarkerColor = function(evt, state, isValid)
	{
		return (isValid) ? this.validColor : this.invalidColor;
	};
	
	/**
	 * Function: getState
	 * 
	 * Uses <getCell>, <getStateToMark> and <intersects> to return the
	 * <mxCellState> for the given event and cell.
	 */
	mxCellMarker.prototype.getState = function(evt, cell)
	{
		var view = this.graph.getView();
		cell = this.getCell(evt, cell);
		var state = this.getStateToMark(view.getState(cell));

		return (state != null && this.intersects(state, evt)) ? state : null;
	};
	
	/**
	 * Function: getCell
	 * 
	 * Returns the <mxCell> for the given event and cell. This returns the
	 * given cell.
	 */
	mxCellMarker.prototype.getCell = function(evt, cell)
	{
		return cell;
	};
	
	/**
	 * Function: getStateToMark
	 * 
	 * Returns the <mxCellState> to be marked for the given <mxCellState> under
	 * the mouse. This returns the given state.
	 */
	mxCellMarker.prototype.getStateToMark = function(state)
	{
		return state;
	};
	
	/**
	 * Function: intersects
	 * 
	 * Returns true if the given coordinate pair intersects the given state.
	 * This returns true if the <hotspot> is 0 or the coordinates are inside
	 * the hotspot for the given cell state.
	 */
	mxCellMarker.prototype.intersects = function(state, evt)
	{
		if (this.hotspotEnabled && this.hotspot > 0)
		{
			var cx = state.x + state.width / 2;
			var cy = state.y + state.height / 2;
			var w = state.width;
			var h = state.height;
			
			var start = mxUtils.getValue(state.style,
					mxConstants.STYLE_STARTSIZE);

			if (start > 0)
			{
				if (mxUtils.getValue(state.style,
					mxConstants.STYLE_HORIZONTAL, true))
				{
					cy = state.y + start / 2;
					h = start;
				}
				else
				{
					cx = state.x + start / 2;
					w = start;
				}
			}

			var w = Math.max(mxConstants.MIN_HOTSPOT_SIZE,
				w * this.hotspot);
			var h = Math.max(mxConstants.MIN_HOTSPOT_SIZE,
				h * this.hotspot);
			
			if (mxConstants.MAX_HOTSPOT_SIZE > 0)
			{
				w = Math.min(w, mxConstants.MAX_HOTSPOT_SIZE);
				h = Math.min(h, mxConstants.MAX_HOTSPOT_SIZE);
			}
			
			var rect = new mxRectangle(cx - w / 2, cy - h / 2, w, h);
			var point = mxUtils.convertPoint(
				this.graph.container, evt.clientX, evt.clientY);
			
			return mxUtils.contains(rect, point.x, point.y);			
		}
		
		return true;
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes.
	 */
	mxCellMarker.prototype.destroy = function()
	{
		this.graph.getView().removeListener(this.resetHandler);
		this.graph.getModel().removeListener(this.resetHandler);
		
		if (this.shape != null)
		{
			this.shape.destroy();
			this.shape = null;
		}
		
		if (this.edgeShape != null)
		{
			this.edgeShape.destroy();
			this.edgeShape = null;
		}
	};

}
