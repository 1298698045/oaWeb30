/**
 * $Id: mxGraphView.js,v 1.109 2009/01/27 12:32:43 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraphView
 *
 * Extends <mxEventSource> to implement a view for a graph. This
 * class is in charge of computing the absolute coordinates for
 * the relative child geometries, the points for perimeters and
 * edge styles and keeping them cached in <mxCellStates> for
 * faster retrieval. The states are updated whenever the model
 * or the view state (translate, scale) changes. The scale and
 * translate are honoured in the bounds.
 *
 * Event: undo
 *
 * Fires when an undoable change happened. This event fires
 * only once per undoable change, it does not fire again when
 * the change is undone and redone. First argument is the
 * source <mxGraphView>. Second argument is the <mxUndoableEdit>
 * that contains the changes. In this implementation this event
 * is fired when the <currentRoot> of the view has changed
 * to be added into a command history to correctly restory the
 * current root for an undo in a graph. See <mxUndoManager> for
 * an example.
 *
 * Event: scale
 *
 * Fires when the <scale> has changed. First argument is the
 * source <mxGraphView>, second and third arguments are the
 * oldValue and newValue for the scale, respectively.
 *
 * Event: translate
 *
 * Fires when the <translate> has changed. First argument is the
 * source <mxGraphView>, second and third arguments are the
 * x- and y-coordinate for the old translation, fourth and fifth
 * arguments are the coordinates of the new translation.
 * 
 * Event: scaleAndTranslate
 * 
 * Fires when the <translate> has changed. First argument is the
 * source <mxGraphView>, second and third arguments are the
 * x- and y-coordinate for the old translation, fourth and fifth
 * arguments are the coordinates of the new translation.
 *
 * Event: up
 *
 * Fires when the <currentRoot> has changed (upwards). First
 * argument is the source <mxGraphView>, second and third argument
 * are the last and current root, respectively.
 *
 * Event: down
 *
 * Fires when the <currentRoot> has changed (downwards). First
 * argument is the source <mxGraphView>, second and third argument
 * are the last and current root, respectively.
 */
{

	/**
	 * Constructor: mxGraphView
	 *
	 * Constructs a new view for the given <mxGraph>.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 */
	function mxGraphView(graph)
	{
		this.graph = graph;
		this.translate = new mxPoint();
		this.bounds = new mxRectangle();
		this.states = new mxDictionary();
	};

	/**
	 * Extends mxEventSource.
	 */
	mxGraphView.prototype = new mxEventSource();
	mxGraphView.prototype.constructor = mxGraphView;

	/**
	 * Variable: doneResource
	 * 
	 * Specifies the resource key for the status message after a long operation.
	 * If the resource for this key does not exist then the value is used as
	 * the status message. Default is 'done'.
	 */
	mxGraphView.prototype.doneResource = (mxClient.language != 'none') ? 'done' : '';
	
	/**
	 * Function: updatingDocumentResource
	 *
	 * Specifies the resource key for the status message while the document is
	 * being updated. If the resource for this key does not exist then the
	 * value is used as the status message. Default is 'updatingDocument'.
	 */
	mxGraphView.prototype.updatingDocumentResource = (mxClient.language != 'none') ? 'updatingDocument' : '';
	
	/**
	 * Variable: graph
	 *
	 * Reference to the enclosing <mxGraph>.
	 */
	mxGraphView.prototype.graph = null;

	/**
	 * Variable: currentRoot
	 *
	 * <mxCell> that acts as the root of the displayed cell hierarchy.
	 */
	mxGraphView.prototype.currentRoot = null;

	/**
	 * Variable: captureDocumentGesture
	 * 
	 * Specifies if a gesture should be captured when it goes outside of the
	 * graph container. Default is true.
	 */
	mxGraphView.prototype.captureDocumentGesture = true;

	/**
	 * Variable: bounds
	 *
	 * <mxRectangle> that caches the scales, translated bounds of the current view.
	 */
	mxGraphView.prototype.bounds = null;
	
	/**
	 * Variable: scale
	 * 
	 * Specifies the scale. Default is 1 (100%).
	 */
	mxGraphView.prototype.scale = 1;
		
	/**
	 * Variable: translate
	 *
	 * <mxPoint> that specifies the current translation. Default is a new
	 * empty <mxPoint>.
	 */
	mxGraphView.prototype.translate = null;
	
	/**
	 * Function: getBounds
	 *
	 * Returns the bounds (on the screen) for the given array of <mxCells>.
	 *
	 * Parameters:
	 *
	 * cells - Array of <mxCells> to return the bounds for.
	 */
	mxGraphView.prototype.getBounds = function(cells)
	{
		var result = null;
		
		if (cells != null && cells.length > 0)
		{
			for (var i = 0; i < cells.length; i++)
			{
				var state = this.getState(cells[i]);
			
				if (state != null)
				{
					if (result == null)
					{
						result = new mxRectangle(state.x, state.y,
							state.width, state.height);
					}
					else
					{
						result.add(state);
					}
				}
			}
		}
		
		return result;
	};

	/**
	 * Function: setCurrentRoot
	 *
	 * Sets and returns the current root and fires an <undo> event before
	 * calling <mxGraph.sizeDidChange>.
	 *
	 * Parameters:
	 *
	 * root - <mxCell> that specifies the root of the displayed cell hierarchy.
	 */
	mxGraphView.prototype.setCurrentRoot = function(root)
	{
		if (this.currentRoot != root)
		{
			var change = new mxCurrentRootChange(this, root);
			change.execute();
			
			var edit = new mxUndoableEdit(this, false);
			edit.add(change);
			
			this.dispatchEvent('undo', this, edit);
			this.graph.sizeDidChange();
		}
		
		return root;
	};

	/**
	 * Function: scaleAndTranslate
	 *
	 * Sets the scale and translation and fires a <scale> and <translate> event
	 * before calling <revalidate> followed by <mxGraph.sizeDidChange>.
	 *
	 * Parameters:
	 *
	 * scale - Decimal value that specifies the new scale (1 is 100%).
	 * dx - X-coordinate of the translation.
	 * dy - Y-coordinate of the translation.
	 */
	mxGraphView.prototype.scaleAndTranslate = function(scale, dx, dy)
	{
		var oldScale = this.scale;
		var oldDx = this.translate.x;
		var oldDy = this.translate.y;
		
		if (this.scale != scale ||
			this.translate.x != dx ||
			this.translate.y != dy)
		{
			this.scale = scale;
			
			this.translate.x = dx;
			this.translate.y = dy;
			
			this.revalidate();
			this.graph.sizeDidChange();
		}
		
		this.dispatchEvent('scaleAndTranslate', this, oldScale, scale, oldDx, oldDy, dx, dy);
	};
	
	/**
	 * Function: getScale
	 * 
	 * Returns the <scale>.
	 */
	mxGraphView.prototype.getScale = function()
	{
		return this.scale;
	};

	/**
	 * Function: setScale
	 *
	 * Sets the scale and fires a <scale> event before calling <revalidate> followed
	 * by <mxGraph.sizeDidChange>.
	 *
	 * Parameters:
	 *
	 * scale - Decimal value that specifies the new scale (1 is 100%).
	 */
	mxGraphView.prototype.setScale = function(scale)
	{
		var oldScale = this.scale;
		
		if (this.scale != scale)
		{
			this.scale = scale;

			this.revalidate();
			this.graph.sizeDidChange();
		}
		
		this.dispatchEvent('scale', this, oldScale, scale);
	};
	
	/**
	 * Function: getTranslate
	 * 
	 * Returns the <translate>.
	 */
	mxGraphView.prototype.getTranslate = function()
	{
		return this.translate;
	};

	/**
	 * Function: setTranslate
	 *
	 * Sets the translation and fires a <translate> event before calling
	 * <revalidate> followed by <mxGraph.sizeDidChange>. The translation is the
	 * negative of the origin.
	 *
	 * Parameters:
	 *
	 * dx - X-coordinate of the translation.
	 * dy - Y-coordinate of the translation.
	 */
	mxGraphView.prototype.setTranslate = function(dx, dy)
	{
		var oldDx = this.translate.x;
		var oldDy = this.translate.y;
		
		if (this.translate.x != dx ||
			this.translate.y != dy)
		{
			this.translate.x = dx;
			this.translate.y = dy;

			this.revalidate();
			this.graph.sizeDidChange();
		}
		
		this.dispatchEvent('translate', this, oldDx, oldDy, dx, dy);
	};

	/**
	 * Function: refresh
	 *
	 * Clears the view if <currentRoot> is not null and revalidates.
	 */
	mxGraphView.prototype.refresh = function()
	{
		if (this.currentRoot != null)
		{
			this.clear();
		}
		
		this.revalidate();
	};

	/**
	 * Function: revalidate
	 *
	 * Revalidates the complete view with all cell states.
	 */
	mxGraphView.prototype.revalidate = function()
	{
		this.invalidate();
		this.validate();
	};

	/**
	 * Function: clear
	 *
	 * Removes the state of the given cell and all descendants if the given
	 * cell is not the current root.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> for which the state should be removed. Default
	 * is the root of the model.
	 * force - Boolean indicating if the current root should be ignored for
	 * recursion.
	 */
	mxGraphView.prototype.clear = function(cell, force, recurse)
	{
		var model = this.graph.getModel();
		cell = cell || model.getRoot();
		force = (force != null) ? force : false;
		recurse = (recurse != null) ? recurse : true;
		
		this.removeState(cell);
		
		if (recurse && (force ||
			cell != this.currentRoot))
		{
			var childCount = model.getChildCount(cell);
			
			for (var i = 0; i < childCount; i++)
			{
				this.clear(model.getChildAt(cell, i),
					force);
			}
		}
		else
		{
			this.invalidate(cell);
		}
	};
	
	/**
	 * Function: invalidate
	 * 
	 * Invalidates the state of the given cell, all its descendants and
	 * connected edges.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> to be invalidated. Default is the root of the
	 * model.
	 */
	mxGraphView.prototype.invalidate = function(cell)
	{
		var model = this.graph.getModel();
		cell = cell || model.getRoot();
		
		var state = this.getState(cell);
		
		if (state == null ||
			!state.invalid)
		{
			if (state != null)
			{
				state.invalid = true;
			}
			
			// Recursively invalidates all descendants
			var childCount = model.getChildCount(cell);
			
			for (var i = 0; i < childCount; i++)
			{
				var child = model.getChildAt(cell, i);
				this.invalidate(child);
			}
			
			// Propagates invalidation to all connected edges
			var edgeCount = model.getEdgeCount(cell);
			
			for (var i = 0; i < edgeCount; i++)
			{
				this.invalidate(model.getEdgeAt(cell, i));
			}
		}
	};

	/**
	 * Function: validate
	 *
	 * First validates all bounds and then validates all points recursively on
	 * all visible cells starting at the given cell. Finally the background
	 * is validated using <validateBackground>.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> to be used as the root of the validation.
	 * Default is <currentRoot> or the root of the model.
	 */
	mxGraphView.prototype.validate = function(cell)
	{
		var t0 = mxLog.enter('mxGraphView.validate');
		window.status = mxResources.get(this.updatingDocumentResource) ||
			this.updatingDocumentResource;
		
		cell = cell || ((this.currentRoot != null) ?
				this.currentRoot :
					this.graph.getModel().getRoot());
		this.validateBounds(null, cell);
		this.bounds = this.validatePoints(null, cell);
		this.validateBackground();
		
		window.status = mxResources.get(this.doneResource) ||
			this.doneResource;
		mxLog.leave('mxGraphView.validate', t0);
	};

	/**
	 * Function: validateBackground
	 *
	 * Validates the background image.
	 */
	mxGraphView.prototype.validateBackground = function()
	{
		var bg = this.graph.getBackgroundImage();
		
		if (bg != null)
		{
			if (this.backgroundImage == null ||
				this.backgroundImage.image != bg.src)
			{
				if (this.backgroundImage != null)
				{
					this.backgroundImage.destroy();
				}
				
				var bounds = new mxRectangle(0, 0, 1, 1);
				
				this.backgroundImage = new mxImageShape(bounds, bg.src);
				this.backgroundImage.dialect = this.graph.dialect;
				this.backgroundImage.init(this.backgroundPane);
			}
			
			this.redrawBackground(this.backgroundImage, bg);
		}
		else if (this.backgroundImage != null)
		{
			this.backgroundImage.destroy();
			this.backgroundImage = null;
		}
	};

	/**
	 * Function: redrawBackground
	 *
	 * Updates the bounds and redraws the background image.
	 * 
	 * Example:
	 * 
	 * If the background image should not be scaled, this can be replaced with
	 * the following.
	 * 
	 * (code)
	 * mxGraphView.prototype.redrawBackground = function(backgroundImage, bg)
	 * {
	 *   backgroundImage.bounds.x = this.translate.x;
	 *   backgroundImage.bounds.y = this.translate.y;
	 *   backgroundImage.bounds.width = bg.width;
	 *   backgroundImage.bounds.height = bg.height;
	 *
	 *   backgroundImage.redraw();
	 * };
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * backgroundImage - <mxImageShape> that represents the background image.
	 * bg - <mxImage> that specifies the image to be used for the background.
	 */
	mxGraphView.prototype.redrawBackground = function(backgroundImage, bg)
	{
		backgroundImage.scale = this.scale;
		backgroundImage.bounds.x = this.scale*this.translate.x;
		backgroundImage.bounds.y = this.scale*this.translate.y;
		backgroundImage.bounds.width = this.scale*bg.width;
		backgroundImage.bounds.height = this.scale*bg.height;

		backgroundImage.redraw();
	};

	/**
	 * Function: validateBounds
	 *
	 * Validates the bounds of the given parent's child using the given parent
	 * state as the origin for the child. The validation is carried out
	 * recursively for all non-collapsed descendants.
	 * 
	 * Parameters:
	 * 
	 * parentState - <mxCellState> for the given parent.
	 * cell - <mxCell> for which the bounds in the state should be updated.
	 */
	mxGraphView.prototype.validateBounds = function(parentState, cell)
	{
		var model = this.graph.getModel();
		var state = this.getState(cell, true);

		if (state != null &&
			state.invalid)
		{
			if (!this.graph.isCellVisible(cell))
			{
				this.removeState(cell);
			}
			
			// Updates the cell state's origin
			else if (cell != this.currentRoot &&
				parentState != null)
			{
				state.origin.x = parentState.origin.x;
				state.origin.y = parentState.origin.y;
				var geo = this.graph.getCellGeometry(cell);				

				if (geo != null)
				{
					if (!model.isEdge(cell))
					{
						var offset = geo.offset || new mxPoint();

						if (geo.relative)
						{
							state.origin.x += geo.x * parentState.width / 
								this.scale + offset.x;
							state.origin.y += geo.y * parentState.height /
								this.scale + offset.y;
						}
						else
						{
							state.absoluteOffset.x = this.scale * offset.x;
							state.absoluteOffset.y = this.scale * offset.y;
							state.origin.x += geo.x;
							state.origin.y += geo.y;
						}
					}

					// Updates cell state's bounds
					state.x = this.scale * (this.translate.x + state.origin.x);
					state.y = this.scale * (this.translate.y + state.origin.y);
					state.width = this.scale * geo.width;
					state.height = this.scale * geo.height;

					if (model.isVertex(cell))
					{
						this.updateVertexLabelOffset(state);
					}
				}
			}
							
			// Applies child offset to origin
			var offset = this.graph.getChildOffsetForCell(cell);
			
			if (offset != null)
			{
				state.origin.x += offset.x;
				state.origin.y += offset.y;
			}
		}

		// Recursively validates the child bounds
		if (state != null &&
			(!this.graph.isCellCollapsed(cell) ||
			cell == this.currentRoot))
		{
			var childCount = model.getChildCount(cell);
			
			for (var i=0; i<childCount; i++)
			{
				var child = model.getChildAt(cell, i);
				this.validateBounds(state, child);
			}
		}
	};
	
	/**
	 * Function: updateVertexLabelOffset
	 * 
	 * Updates the absoluteOffset of the given vertex cell state. This takes
	 * into account the label position styles.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose absolute offset should be updated.
	 */
	mxGraphView.prototype.updateVertexLabelOffset = function(state)
	{
		var horizontal = mxUtils.getValue(state.style,
				mxConstants.STYLE_LABEL_POSITION,
				mxConstants.ALIGN_CENTER);
		
		if (horizontal == mxConstants.ALIGN_LEFT)
		{
			state.absoluteOffset.x -= state.width;
		}
		else if (horizontal == mxConstants.ALIGN_RIGHT)
		{
			state.absoluteOffset.x += state.width;
		}
		
		var vertical = mxUtils.getValue(state.style,
				mxConstants.STYLE_VERTICAL_LABEL_POSITION,
				mxConstants.ALIGN_MIDDLE);
		
		if (vertical == mxConstants.ALIGN_TOP)
		{
			state.absoluteOffset.y -= state.height;
		}
		else if (vertical == mxConstants.ALIGN_BOTTOM)
		{
			state.absoluteOffset.y += state.height;
		}
	};

	/**
	 * Function: validatePoints
	 * 
	 * Validates the points for the state of the given cell recursively if the
	 * cell is not collapsed and returns the bounding box of all visited states
	 * as an <mxRectangle>.
	 * 
	 * Parameters:
	 * 
	 * parentState - <mxCellState> for the parent cell.
	 * cell - <mxCell> whose points in the state should be updated.
	 */
	mxGraphView.prototype.validatePoints = function(parentState, cell)
	{
		var minX = null;
		var minY = null;
		var maxX = 0;
		var maxY = 0;

		var model = this.graph.getModel();
		var state = this.getState(cell);
		
		if (state != null)
		{
			if (state.invalid)
			{
				var geo = this.graph.getCellGeometry(cell);

				if (model.isEdge(cell))
				{
					var source = this.getVisibleTerminal(cell, true);
					
					if (source != null &&
						!model.isAncestor(source, cell))
					{
						var p = model.getParent(source);
						var pstate = this.getState(p);
						
						this.validatePoints(pstate, source);
					}
					
					var target = this.getVisibleTerminal(cell, false);
					
					if (target != null &&
						!model.isAncestor(target, cell))
					{
						var p = model.getParent(target);
						var pstate = this.getState(p);

						this.validatePoints(pstate, target);
					}
					
					this.setTerminalPoints(state);
					this.updatePoints(state, geo.points, source, target);
					this.updateTerminalPoints(state, source, target);
					this.updateEdgeBounds(state);
					this.updateEdgeLabelOffset(state);
				}
				else if (geo != null &&
					geo.relative &&
					parentState != null &&
					model.isEdge(parentState.cell))
				{
					var origin = this.getPoint(parentState, geo);
					
					if (origin != null)
					{
						state.x = origin.x;
						state.y = origin.y;
					}
				}
				
				state.invalid = false;
				
				if (cell != this.currentRoot)
				{
					this.graph.cellRenderer.redraw(state);
				}
			}
			
			if (model.isEdge(cell) ||
				model.isVertex(cell))
			{
				var box = (state.text != null &&
					(!this.graph.isHtmlLabel(cell) ||
					!this.graph.isClipping(cell))) ?
					state.text.boundingBox : null;

				// Adds outer label bounding box to graph bounds
				if (box != null)
				{
					minX = Math.min(state.x, box.x);
					minY = Math.min(state.y, box.y);
					maxX = Math.max(state.x + state.width, box.x + box.width);
					maxY = Math.max(state.y + state.height, box.y + box.height);
				}
				else
				{
					minX = state.x;
					minY = state.y;
					maxX = state.x + state.width;
					maxY = state.y + state.height;
				}
			}
		}
		
		if (state != null &&
			(!this.graph.isCellCollapsed(cell) ||
			cell == this.currentRoot))
		{
			var childCount = model.getChildCount(cell);
			
			for (var i=0; i<childCount; i++)
			{
				var child = model.getChildAt(cell, i);
				var bounds = this.validatePoints(state, child);
					
				minX = (minX != null) ? Math.min(minX, bounds.x) : bounds.x;
				minY = (minY != null) ? Math.min(minY, bounds.y) : bounds.y;
				maxX = Math.max(maxX, bounds.x+bounds.width);
				maxY = Math.max(maxY, bounds.y+bounds.height);
			}
		}
		
		return new mxRectangle(minX, minY, maxX-minX, maxY-minY);
	};

	/**
	 * Function: setTerminalPoints
	 *
	 * Sets the initial absolute terminal points in the given state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose initial terminal points should be
	 * updated.
	 */
	mxGraphView.prototype.setTerminalPoints = function(state)
	{
		var tr = this.translate;
		var s = this.scale;

		var edge = state.cell;
		var orig = state.origin;

		var geo = this.graph.getCellGeometry(edge);
		
		var pt = geo.getTerminalPoint(true);
		
		if (pt != null)
		{
			pt = new mxPoint(s * (tr.x + pt.x + orig.x),
							 s * (tr.y + pt.y + orig.y));
			state.setAbsoluteTerminalPoint(pt, true);
		}
		else
		{
			state.setAbsoluteTerminalPoint(null, true);
		}
		
		pt = geo.getTerminalPoint(false);
		
		if (pt != null)
		{
			pt = new mxPoint(s * (tr.x + pt.x + orig.x),
							 s * (tr.y + pt.y + orig.y));
			state.setAbsoluteTerminalPoint(pt, false);
		}
		else
		{
			state.setAbsoluteTerminalPoint(null, false);
		}
	};
	
	/**
	 * Function: updatePoints
	 *
	 * Updates the absolute points in the given state using the specified array
	 * of <mxPoints> as the relative points.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose absolute points should be updated.
	 * points - Array of <mxPoints> that constitute the relative points.
	 * source - <mxCell> that represents the visual source.
	 * target - <mxCell> that represents the visual target.
	 */
	mxGraphView.prototype.updatePoints = function(state, points, source, target)
	{
		if (state != null)
		{
			var pts = new Array();
			pts.push(state.absolutePoints[0]);
			var edgeStyle = this.getEdgeStyle(state, source, target);
			
			if (edgeStyle != null)
			{
				var src = this.getState(source);
				var trg = this.getState(target);
				edgeStyle(state, src, trg, points, pts);
			}
			else if (points != null)
			{
				for (var i=0; i<points.length; i++)
				{
					var pt = mxUtils.clone(points[i]);
					pts.push(this.transformControlPoint(pt, state.origin));
				}
			}
			
			var tmp = state.absolutePoints;
			pts.push(tmp[tmp.length-1]);

			state.absolutePoints = pts;
		}
	};
	
	/**
	 * Function: transformControlPoint
	 *
	 * Transforms the given control point to an absolute point.
	 */
	mxGraphView.prototype.transformControlPoint = function(pt, origin)
	{
        return new mxPoint((pt.x + this.translate.x + origin.x)
                * this.scale, (pt.y + this.translate.y + origin.y)
                * this.scale);
	}
	
	/**
	 * Function: getEdgeStyle
	 * 
	 * Returns the edge style function to be used to render the given edge
	 * state.
	 */
	mxGraphView.prototype.getEdgeStyle = function(edgeState, source, target)
	{
		var edgeStyle = (source != null && source == target) ?
				mxUtils.getValue(edgeState.style, mxConstants.STYLE_LOOP,
						this.graph.defaultLoopStyle) :
							(!mxUtils.getValue(edgeState.style,
									mxConstants.STYLE_NOEDGESTYLE, false) ?
											edgeState.style[mxConstants.STYLE_EDGE] :
												null);

		// Converts string values to objects
		if (typeof(edgeStyle) == "string")
		{
			var tmp = mxStyleRegistry.get(edgeStyle);
			
			if (tmp == null && tmp.indexOf('.') > 0)
			{
	 			tmp = mxUtils.eval(edgeStyle);
 			}
 			
			edgeStyle = tmp;
		}
		
		if (typeof(edgeStyle) == "function")
		{
			return edgeStyle;
		}
		
		return null;
	};

	/**
	 * Function: updateTerminalPoints
	 *
	 * Updates the terminal points in the given state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose terminal points should be updated.
	 * source - <mxCell> that represents the visual source.
	 * target - <mxCell> that represents the visual target.
	 */
	mxGraphView.prototype.updateTerminalPoints = function(state, source, target)
	{
		if (target != null)
		{
			this.updateTerminalPoint(state, target, source, false);
		}
		
		if (source != null)
		{
			this.updateTerminalPoint(state, source, target, true);
		}
	};

	/**
	 * Function: updateTerminalPoint
	 *
	 * Updates the absolute terminal point in the given state for the given
	 * start and end state, where start is the source if isSource is true.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose terminal point should be updated.
	 * start - <mxCellState> for the source or target terminal.
	 * end - <mxCellState> for the opposite terminal.
	 * isSource - Boolean indicating if start is the state of the source
	 * terminal.
	 */
	mxGraphView.prototype.updateTerminalPoint = function(state, start, end, isSource)
	{
		var pt = this.getPerimeterPoint(state, start, end, isSource);
		state.setAbsoluteTerminalPoint(pt, isSource);
	};
	
	/**
	 * Function: getPerimeterPoint
	 *
	 * Returns an <mxPoint> that defines the location of the connection point
	 * between the edge represented by the given state and the source or target
	 * end of the edge, depending on isSource.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> of the connecting edge.
	 * start - <mxCellState> for the source or target terminal.
	 * end - <mxCellState> for the opposite terminal.
	 * isSource - Boolean indicating if start is the state of the source
	 * terminal.
	 */
	mxGraphView.prototype.getPerimeterPoint = function(state, start, end, isSource)
	{
		var point = null;
		var term = this.getState(start);
		
		if (term != null)
		{
			var perimeter = this.getPerimeterFunction(term);
			var next = this.getNextPoint(state, end, isSource);
			
			if (perimeter != null &&
				next != null)
			{
				var bounds = this.getPerimeterBounds(term, state, isSource);
				point = perimeter(bounds, state, term, isSource, next);
			}
			
			if (point == null)
			{
				point = this.getPoint(term);
			}
		}
		
		return point;
	};
	
	/**
	 * Function: getRoutingCenterX
	 * 
	 * Returns the x-coordinate of the center point for automatic routing.
	 */
	mxGraphView.prototype.getRoutingCenterX = function (state)
	{
		var f = (state.style != null) ? parseFloat(state.style
			[mxConstants.STYLE_ROUTING_CENTER_X]) || 0 : 0;
	
		return state.getCenterX() + f * state.width;
	};
	
	/**
	 * Function: getRoutingCenterY
	 * 
	 * Returns the y-coordinate of the center point for automatic routing.
	 */
	mxGraphView.prototype.getRoutingCenterY = function (state)
	{
		var f = (state.style != null) ? parseFloat(state.style
			[mxConstants.STYLE_ROUTING_CENTER_Y]) || 0 : 0;
	
		return state.getCenterY() + f * state.height;
	};

	/**
	 * Function: getPerimeterBounds
	 *
	 * Returns the perimeter bounds for the given terminal, edge pair as an
	 * <mxRectangle>.
	 */
	mxGraphView.prototype.getPerimeterBounds = function(terminal, edge, isSource)
	{
		var border = 0;
		
		if (edge != null)
		{
			border = parseFloat(edge.style[mxConstants.STYLE_PERIMETER_SPACING] || 0)
			border += parseFloat(edge.style[
				(isSource) ? mxConstants.STYLE_SOURCE_PERIMETER_SPACING
					: mxConstants.STYLE_TARGET_PERIMETER_SPACING] || 0);
		}
		
		if (terminal != null)
		{
			border += parseFloat(terminal.style[mxConstants.STYLE_PERIMETER_SPACING] || 0);
		}

		return terminal.getPerimeterBounds(border * this.scale);
	};
	
	/**
	 * Function: getPerimeterFunction
	 *
	 * Returns the perimeter function for the given state.
	 */
	mxGraphView.prototype.getPerimeterFunction = function(state)
	{
		var perimeter = state.style[mxConstants.STYLE_PERIMETER];

		// Converts string values to objects
		if (typeof(perimeter) == "string")
		{
			var tmp = mxStyleRegistry.get(perimeter);
			
			if (tmp == null && tmp.indexOf('.') > 0)
			{
	 			tmp = mxUtils.eval(perimeter);
 			}
 			
			perimeter = tmp;
		}
		
		if (typeof(perimeter) == "function")
		{
			return perimeter;
		}
		
		return null;
	};

	/**
	 * Function: getNextPoint
	 *
	 * Returns the nearest point in the list of absolute points or the center
	 * of the opposite terminal.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents the edge.
	 * opposite - <mxCell> that represents the opposite terminal.
	 * isSource - Boolean indicating if the next point for the source or target
	 * should be returned.
	 */
	mxGraphView.prototype.getNextPoint = function(state, opposite, isSource)
	{
		var point = null;
		var pts = state.absolutePoints;
		
		if (pts != null &&
			(isSource ||
			pts.length > 2 ||
			opposite == null))
		{
			var count = pts.length;
			point = pts[(isSource) ? Math.min(1, count-1) : Math.max(0, count-2)];
		}
		
		if (point == null &&
			opposite != null)
		{
			var oppositeState = this.getState(opposite);
			
			if (oppositeState != null)
			{
				point = new mxPoint(oppositeState.getCenterX(),
								oppositeState.getCenterY());
			}
		}
		
		return point;
	};

	/**
	 * Function: getVisibleTerminal
	 *
	 * Returns the nearest ancestor terminal that is visible. The edge appears
	 * to be connected to this terminal on the display.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> whose visible terminal should be returned.
	 * isSource - Boolean that specifies if the source or target terminal
	 * should be returned.
	 */
	mxGraphView.prototype.getVisibleTerminal = function(edge, isSource)
	{
		var model = this.graph.getModel();
		var result = model.getTerminal(edge, isSource);
		var best = result;
		
		while (result != null &&
				result != this.currentRoot)
		{
			if (!this.graph.isCellVisible(best) ||
				this.graph.isCellCollapsed(result))
			{
				best = result;
			}
			
			result = model.getParent(result);
		}
		
		return best;
	};

	/**
	 * Function: updateEdgeBounds
	 *
	 * Updates the given state using the bounding box of the absolute points.
	 * Also updates <mxCellState.terminalDistance>, <mxCellState.length> and
	 * <mxCellState.segments>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose bounds should be updated.
	 */
	mxGraphView.prototype.updateEdgeBounds = function(state)
	{
		var points = state.absolutePoints;
		state.length = 0;
		
		if (points != null &&
			points.length > 0)
		{
			var p0 = points[0];
			var pe = points[points.length - 1];
			
			if (p0 == null ||
				pe == null)
			{
				// Drops the edge state

				// Note: This condition normally occurs
				// if a connected edge has a null-terminal, ie.
				// edge.source == null or edge.target == null,
				// which could mean that the terminal-id was not
				// resolved at cell decoding time.
				this.clear(state.cell, true);
			}
			else
			{
				if (p0.x != pe.x ||
					p0.y != pe.y)
				{
					var dx = pe.x - p0.x;
					var dy = pe.y - p0.y;
					state.terminalDistance = Math.sqrt(dx * dx + dy * dy);
				}
				else
				{
					state.terminalDistance = 0;
				}
				
				var length = 0;
				var segments = new Array();
				var pt = p0;
				
				if (pt != null)
				{
					var minX = pt.x;
					var minY = pt.y;
					var maxX = minX;
					var maxY = minY;
					
					for (var i = 1; i < points.length; i++)
					{
						var tmp = points[i];
						
						if (tmp != null)
						{
							var dx = pt.x - tmp.x;
							var dy = pt.y - tmp.y;
							
							var segment = Math.sqrt(dx * dx + dy * dy);
							segments.push(segment);
							length += segment;
							
							pt = tmp;
							
							minX = Math.min(pt.x, minX);
							minY = Math.min(pt.y, minY);
							maxX = Math.max(pt.x, maxX);
							maxY = Math.max(pt.y, maxY);
						}
					}
					
					state.length = length;
					state.segments = segments;
					
					var markerSize = 1; // TODO: include marker size
					
					state.x = minX;
					state.y = minY;
					state.width = Math.max(markerSize, maxX - minX);
					state.height = Math.max(markerSize, maxY - minY);
				}
			}
		}
	};

	/**
	 * Function: getPoint
	 *
	 * Returns the absolute point on the edge for the given relative
	 * <mxGeometry> as an <mxPoint>. The edge is represented by the given
	 * <mxCellState>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents the state of the parent edge.
	 * geometry - <mxGeometry> that represents the relative location.
	 */
	mxGraphView.prototype.getPoint = function(state, geometry)
	{
		var x = state.getCenterX();
		var y = state.getCenterY();
		
		if (state.segments != null &&
			(geometry == null ||
			geometry.relative))
		{
			var gx = (geometry != null) ? geometry.x / 2 : 0;
			var pointCount = state.absolutePoints.length;
			var dist = (gx + 0.5) * state.length;
			var segment = state.segments[0];
			var length = 0;				
			var index = 1;

			while (dist > length + segment &&
					index < pointCount-1)
			{
				length += segment;
				segment = state.segments[index++];
			}
	
			if (segment != 0)
			{
				var factor = (dist - length) / segment;
				var p0 = state.absolutePoints[index-1];
				var pe = state.absolutePoints[index];
		
				if (p0 != null &&
					pe != null)
				{
					var gy = 0;
					var offsetX = 0;
					var offsetY = 0;

					if (geometry != null)
					{
						gy = geometry.y;
						var offset = geometry.offset;
						
						if (offset != null)
						{
							offsetX = offset.x;
							offsetY = offset.y;
						}
					}

					var dx = pe.x - p0.x;
					var dy = pe.y - p0.y;
					var nx = dy / segment;
					var ny = dx / segment;
					
					x = p0.x + dx * factor + (nx * gy + offsetX) * this.scale;
					y = p0.y + dy * factor - (ny * gy - offsetY) * this.scale;
				}
			}
		}
		else if (geometry != null)
		{
			var offset = geometry.offset;
			
			if (offset != null)
			{
				x += offset.x;
				y += offset.y;
			}
		}
		
		return new mxPoint(x, y);		
	};

	/**
	 * Function: getRelativePoint
	 *
	 * Gets the relative point that describes the given, absolute label
	 * position for the given edge state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents the state of the parent edge.
	 * x - Specifies the x-coordinate of the absolute label location.
	 * y - Specifies the y-coordinate of the absolute label location.
	 */
	mxGraphView.prototype.getRelativePoint = function(edgeState, x, y)
	{
		var model = this.graph.getModel();
		var geometry = model.getGeometry(edgeState.cell);
		
		if (geometry != null)
		{
			var pointCount = edgeState.absolutePoints.length;
			
			if (geometry.relative &&
				pointCount > 1)
			{
				var totalLength = edgeState.length;
				var segments = edgeState.segments;
	
				// Works which line segment the point of the label is closest to
				var p0 = edgeState.absolutePoints[0];
				var pe = edgeState.absolutePoints[1];
				var minDist = mxUtils.ptSegDistSq(p0.x, p0.y, pe.x, pe.y, x, y);
	
				var index = 0;
				var tmp = 0;
				var length = 0;
				
				for (var i = 2; i < pointCount; i++)
				{
					tmp += segments[i - 2];
					pe = edgeState.absolutePoints[i];
					var dist = mxUtils.ptSegDistSq(p0.x, p0.y, pe.x, pe.y, x, y);
	
					if (dist <= minDist)
					{
						minDist = dist;
						index = i - 1;
						length = tmp;
					}
					
					p0 = pe;
				}
				
				var seg = segments[index];
				p0 = edgeState.absolutePoints[index];
				pe = edgeState.absolutePoints[index + 1];
				
				var x2 = p0.x;
				var y2 = p0.y;
				
				var x1 = pe.x;
				var y1 = pe.y;
				
				var px = x;
				var py = y;
				
				var xSegment = x2 - x1;
				var ySegment = y2 - y1;
				
				px -= x1;
				py -= y1;
				var projlenSq = 0;
				
				px = xSegment - px;
				py = ySegment - py;
				var dotprod = px * xSegment + py * ySegment;

				if (dotprod <= 0.0)
				{
					projlenSq = 0;
				}
				else
				{
					projlenSq = dotprod * dotprod
							/ (xSegment * xSegment + ySegment * ySegment);
				}

				var projlen = Math.sqrt(projlenSq);

				if (projlen > seg)
				{
					projlen = seg;
				}

				var yDistance = Math.sqrt(mxUtils.ptSegDistSq(p0.x, p0.y, pe
						.x, pe.y, x, y));
				var direction = mxUtils.relativeCcw(p0.x, p0.y, pe.x, pe.y, x, y);

				if (direction == -1)
				{
					yDistance = -yDistance;
				}

				// Constructs the relative point for the label
				return new mxPoint(((totalLength / 2 - length - projlen) / totalLength) * -2,
							yDistance / this.scale);
			}
		}
		
		return new mxPoint();
	};

	/**
	 * Function: updateEdgeLabelOffset
	 *
	 * Updates <mxCellState.absoluteOffset> for the given state. The absolute
	 * offset is normally used for the position of the edge label. Is is
	 * calculated from the geometry as an absolute offset from the center
	 * between the two endpoints if the geometry is absolute, or as the
	 * relative distance between the center along the line and the absolute
	 * orthogonal distance if the geometry is relative.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose absolute offset should be updated.
	 */
	mxGraphView.prototype.updateEdgeLabelOffset = function(state)
	{
		var points = state.absolutePoints;
		
		state.absoluteOffset.x = state.getCenterX();
		state.absoluteOffset.y = state.getCenterY();

		if (points != null &&
			points.length > 0 &&
			state.segments != null)
		{
			var geometry = this.graph.getCellGeometry(state.cell);
			
			if (geometry.relative)
			{
				var offset = this.getPoint(state, geometry);
				
				if (offset != null)
				{
					state.absoluteOffset = offset;
				}
			}
			else
			{
				var p0 = points[0];
				var pe = points[points.length - 1];
				
				if (p0 != null &&
					pe != null)
				{
					var dx = pe.x - p0.x;
					var dy = pe.y - p0.y;
					var x0 = 0;
					var y0 = 0;

					var off = geometry.offset;
					
					if (off != null)
					{
						x0 = off.x;
						y0 = off.y;
					}
					
					var x = p0.x + dx / 2 + x0 * this.scale;
					var y = p0.y + dy / 2 + y0 * this.scale;
					
					state.absoluteOffset.x = x;
					state.absoluteOffset.y = y;
				}
			}
		}
	};
	
	/**
	 * Function: getState
	 *
	 * Returns the <mxCellState> for the given cell. If create is true, then
	 * the state is created if it does not yet exist.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the <mxCellState> should be returned.
	 * create - Optional boolean indicating if a new state should be created
	 * if it does not yet exist. Default is false.
	 */
	mxGraphView.prototype.getState = function(cell, create)
	{
		create = create || false;

		var state = null;
		
		if (cell != null)
		{
			state = this.states.get(cell);
			
			if (state == null &&
				create &&
				this.graph.isCellVisible(cell))
			{
				state = this.createState(cell);
				this.states.put(cell, state);
			}
		}
		
		return state;
	};
	
	/**
	 * Function: getStates
	 *
	 * Returns the <mxCellStates> for the given array of <mxCells>. The array
	 * contains all states that are not null, that is, the returned array may
	 * have less elements than the given array.
	 */
	mxGraphView.prototype.getStates = function(cells)
	{
		var result = new Array();
		
		for (var i = 0; i < cells.length; i++)
		{
			var state = this.getState(cells[i]);
			
			if (state != null)
			{
				result.push(state);
			}
		}
		
		return result;
	};
	
	/**
	 * Function: removeState
	 *
	 * Removes and returns the <mxCellState> for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the <mxCellState> should be removed.
	 */
	mxGraphView.prototype.removeState = function(cell)
	{
		var state = null;
		
		if (cell != null)
		{
			state = this.states.remove(cell);
			
			if (state != null)
			{
				this.graph.cellRenderer.destroy(state);
				state.destroy();
			}
		}
		
		return state;
	};
	
	/**
	 * Function: createState
	 *
	 * Creates and returns an <mxCellState> for the given cell and initializes
	 * it using <mxCellRenderer.initialize>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which a new <mxCellState> should be created.
	 */
	mxGraphView.prototype.createState = function(cell)
	{
		var style = this.graph.getCellStyle(cell);
		var state = new mxCellState(this, cell, style);
		
		this.graph.cellRenderer.initialize(state);
		
		return state;
	};
		
	/**
	 * Function: getCanvas
	 *
	 * Returns the DOM node that contains the background-, draw- and
	 * overlaypane.
	 */
	mxGraphView.prototype.getCanvas = function()
	{
		return this.canvas;
	};

	/**
	 * Function: getBackgroundPane
	 *
	 * Returns the DOM node that represents the background layer.
	 */
	mxGraphView.prototype.getBackgroundPane = function()
	{
		return this.backgroundPane;
	};
	
	/**
	 * Function: getDrawPane
	 *
	 * Returns the DOM node that represents the main drawing layer.
	 */
	mxGraphView.prototype.getDrawPane = function()
	{
		return this.drawPane;
	};

	/**
	 * Function: getOverlayPane
	 *
	 * Returns the DOM node that represents the topmost drawing layer.
	 */
	mxGraphView.prototype.getOverlayPane = function()
	{
		return this.overlayPane;
	};

	/**
	 * Function: isContainerEvent
	 * 
	 * Returns true if the event origin is one of the drawing panes or
	 * containers of the view.
	 */
	 mxGraphView.prototype.isContainerEvent = function(evt)
	{
		var source = mxEvent.getSource(evt);
		var bgNode = (this.backgroundImage != null) ?
			this.backgroundImage.node : null;
		
		return (source == this.graph.container ||
			source.parentNode == bgNode ||
			source == this.canvas.parentNode ||
			source == this.canvas ||
			source == this.backgroundPane ||
			source == this.drawPane ||
			source == this.overlayPane);
	};

	/**
	 * Function: isScrollEvent
	 * 
	 * Returns true if the event origin is one of the scrollbars of the
	 * container in IE. Such events are ignored.
	 */
	 mxGraphView.prototype.isScrollEvent = function(evt)
	{
		var offset = mxUtils.getOffset(this.graph.container);
		var pt = new mxPoint(evt.clientX - offset.x, evt.clientY - offset.y);

		var outWidth = this.graph.container.offsetWidth;
		var inWidth = this.graph.container.clientWidth;

		if (outWidth > inWidth &&
			pt.x > inWidth + 2 &&
			pt.x <= outWidth)
		{
			return true;
		}

		var outHeight = this.graph.container.offsetHeight;
		var inHeight = this.graph.container.clientHeight;
		
		if (outHeight > inHeight &&
			pt.y > inHeight + 2 &&
			pt.y <= outHeight)
		{
			return true;
		}
		
		return false;
	};
	
	/**
	 * Function: init
	 *
	 * Initializes the graph event dispatch loop for the specified container
	 * and invokes <create> to create the required DOM nodes for the display.
	 */
	mxGraphView.prototype.init = function()
	{
		var graph = this.graph;
		var container = graph.container;
		
		if (container != null)
		{
			// Adds basic listeners for graph event dispatching
			var self = this; // closure
			mxEvent.addListener(container, 'mousedown', function (evt)
			{
				if (self.isContainerEvent(evt) &&
					((!mxClient.IS_IE &&
					!mxClient.IS_GC &&
					!mxClient.IS_SF) ||
					!self.isScrollEvent(evt)))
				{
					graph.dispatchGraphEvent('mousedown', evt);
				}
			});
			mxEvent.addListener(container, 'mousemove', function (evt)
			{
				if (self.isContainerEvent(evt))
				{
					graph.dispatchGraphEvent('mousemove', evt);
				}
			});
			mxEvent.addListener(container, 'mouseup', function (evt)
			{
				if (self.isContainerEvent(evt))
				{
					graph.dispatchGraphEvent('mouseup', evt);
				}
			});
			
			// Adds listener for double click handling on background
			mxEvent.addListener(container, 'dblclick', function (evt)
			{
				graph.dblClick(evt);
				mxEvent.consume(evt);
			});
						
			// Adds basic listeners for graph event dispatching outside of the
			// container and finishing the handling of a single gesture
			mxEvent.addListener(document, 'mousedown', function (evt)
			{
				if (self.isContainerEvent(evt))
				{
					graph.panningHandler.hideMenu();
				}
			});
			mxEvent.addListener(document, 'mousemove', function (evt)
			{
				// Hides the tooltip if mouse is outside container
				graph.tooltipHandler.hide();
				
				if (self.captureDocumentGesture &&
					graph.gestureHandler != null)
				{
					graph.dispatchGraphEvent('mousemove', evt);
				}
			});
			mxEvent.addListener(document, 'mouseup', function (evt)
			{
				if (self.captureDocumentGesture &&
					graph.gestureHandler != null)
				{
					graph.dispatchGraphEvent('mouseup', evt);
				}
			});
		}
		
		// Creates the DOM nodes for the respective display dialect
		if (graph.dialect == mxConstants.DIALECT_SVG)
		{
			this.createSvg();
		}
		else if (graph.dialect == mxConstants.DIALECT_VML)
		{
			this.createVml();
		}
		else
		{
			this.createHtml();
		}
	};

	/**
 * Function: create
	 *
	 * Creates the DOM nodes for the HTML display.
	 */
	mxGraphView.prototype.createHtml = function()
	{
		var container = this.graph.container;
		
		if (container != null)
		{
			this.canvas = this.createHtmlPane();
		
			// Uses minimal size for stacked DIVs on Canvas. This is required
			// for correct event processing in IE. If we have an overlapping
			// DIV then the events on the cells are only fired when over a
			// text region.
			this.backgroundPane = this.createHtmlPane(1, 1);
			this.drawPane = this.createHtmlPane(1, 1);
			this.overlayPane = this.createHtmlPane(1, 1);
			
			this.canvas.appendChild(this.backgroundPane);
			this.canvas.appendChild(this.drawPane);
			this.canvas.appendChild(this.overlayPane);

			container.appendChild(this.canvas);
		}
	};
	
	/**
	 * Function: createHtmlPane
	 * 
	 * Creates and returns a drawing pane in HTML (DIV).
	 */
	mxGraphView.prototype.createHtmlPane = function(width, height)
	{
		var pane = document.createElement('DIV');
		
		if (width != null &&
			height != null)
		{
			pane.style.position = 'absolute';
			pane.style.left = '0px';
			pane.style.top = '0px';

			pane.style.width = width+'px';
			pane.style.height = height+'px';
		}
		else
		{
			pane.style.position = 'relative';
		}
		
		return pane;
	};

	/**
	 * Function: create
	 *
	 * Creates the DOM nodes for the VML display.
	 */
	mxGraphView.prototype.createVml = function()
	{
		var container = this.graph.container;

		if (container != null)
		{
			var width = container.offsetWidth;
			var height = container.offsetHeight;
			this.canvas = this.createVmlPane(width, height);
			
			this.backgroundPane = this.createVmlPane(width, height);
			this.drawPane = this.createVmlPane(width, height);
			this.overlayPane = this.createVmlPane(width, height);
			
			this.canvas.appendChild(this.backgroundPane);
			this.canvas.appendChild(this.drawPane);
			this.canvas.appendChild(this.overlayPane);
			
			container.appendChild(this.canvas);
		}
	};
	
	/**
	 * Function: createVmlPane
	 * 
	 * Creates a drawing pane in VML (group).
	 */
	mxGraphView.prototype.createVmlPane = function(width, height)
	{
		var pane = document.createElement('v:group');
		
		// At this point the width and height are potentially
		// uninitialized. That's OK.
		pane.style.position = 'absolute';
		pane.style.left = '0px';
		pane.style.top = '0px';

		pane.style.width = width+'px';
		pane.style.height = height+'px';

		pane.setAttribute('coordsize', width+','+height);
		pane.setAttribute('coordorigin', '0,0');
		
		return pane;
	};

	/**
	 * Function: create
	 *
	 * Creates and returns the DOM nodes for the SVG display.
	 */
	mxGraphView.prototype.createSvg = function()
	{
		var container = this.graph.container;
		
		this.canvas = document.createElementNS(mxConstants.NS_SVG, 'g');
		
		// For background image
		this.backgroundPane = document.createElementNS(mxConstants.NS_SVG, 'g');
		this.canvas.appendChild(this.backgroundPane);

		// Adds two layers (background is early feature)
		this.drawPane = document.createElementNS(mxConstants.NS_SVG, 'g');
		this.canvas.appendChild(this.drawPane);

		this.overlayPane = document.createElementNS(mxConstants.NS_SVG, 'g');
		this.canvas.appendChild(this.overlayPane);
		
		var root = document.createElementNS(mxConstants.NS_SVG, 'svg');

		// Updates the clipping region of the svg element after
		// a resize. This is required in Firefox.
		var self = this; // closure
		var onResize = function(evt)
		{
			if (self.graph.container != null)
			{
				var width = self.graph.container.offsetWidth;
				var height = self.graph.container.offsetHeight;

				root.setAttribute('width', Math.max(width, self.bounds.width));
				root.setAttribute('height', Math.max(height, self.bounds.height));
			}
		};
		
		mxEvent.addListener(window, 'resize', onResize);
		
		if (mxClient.IS_OP)
		{
			onResize();
		}
		
		root.appendChild(this.canvas);
		
		if (container != null)
		{
			container.appendChild(root);
			
			// Workaround for offset of container
			var style = mxUtils.getCurrentStyle(container);
			
			if (style.position == 'static')
			{
				container.style.position = 'relative';
			}
		}
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the view and all its resources.
	 */
	mxGraphView.prototype.destroy = function()
	{
		var root = this.canvas.ownerSVGElement || this.canvas;
		
		if (root.parentNode != null)
		{
			this.clear(this.currentRoot, true);
			mxEvent.removeAllListeners(document);
			mxUtils.release(this.graph.container);
			root.parentNode.removeChild(root);
			
			this.canvas = null;
			this.backgroundPane = null;
			this.drawPane = null;
			this.overlayPane = null;
		}
	};
	
	/**
	 * Class: mxCurrentRootChange
	 *
	 * Action to change the current root in a view.
	 *
	 * Constructor: mxCurrentRootChange
	 *
	 * Constructs a change of the current root in the given view.
	 */
	function mxCurrentRootChange(view, root)
	{
		this.view = view;
		this.root = root;
		this.previous = root;
		this.isUp = root == null;
		
		if (!this.isUp)
		{
			var tmp = this.view.currentRoot;
			var model = this.view.graph.getModel();
			
			while (tmp != null)
			{
				if (tmp == root)
				{
					this.isUp = true;
					break;
				}
				
				tmp = model.getParent(tmp);
			}
		}
	};

	/**
	 * Function: execute
	 *
	 * Changes the current root of the view.
	 */
	mxCurrentRootChange.prototype.execute = function()
	{
		var tmp = this.view.currentRoot;
		this.view.currentRoot = this.previous;
		this.previous = tmp;

		var translate = this.view.graph.getTranslateForRoot(this.view.currentRoot);
		
		if (translate != null)
		{
			this.view.translate = new mxPoint(-translate.x, -translate.y);
		}
				
		var name = (this.isUp) ? 'up' : 'down';
		this.view.dispatchEvent(name, this.view, this.previous, this.view.currentRoot);
		
		if (this.isUp)
		{
			this.view.clear(this.view.currentRoot, true);
			this.view.validate();
		}
		else
		{
			this.view.refresh();
		}
		
		this.isUp = !this.isUp;
	};

}
