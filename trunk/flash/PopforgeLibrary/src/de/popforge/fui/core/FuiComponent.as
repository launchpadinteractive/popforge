/**
 * Copyright(C) 2007 Andre Michelle and Joa Ebert
 *
 * PopForge is an ActionScript3 code sandbox developed by Andre Michelle and Joa Ebert
 * http://sandbox.popforge.de
 * 
 * This file is part of PopforgeAS3Audio.
 * 
 * PopforgeAS3Audio is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 * 
 * PopforgeAS3Audio is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */
package de.popforge.fui.core
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class FuiComponent extends Sprite
	{
		/**
		 * The tag that has been used to define this component.
		 */
		protected var _tag: XML;

		protected var _rows: uint;
		protected var _cols: uint;
		
		protected var tileSize: uint;
		
		protected var targetWidth: uint;
		protected var targetHeight: uint;

		/**
		 * Renders the component by creating all the necessary display objects.
		 * 
		 * @throws ImplementationRequiredError If this method is not overriden.
		 */	
		protected function build(): void
		{
			throw new ImplementationRequiredError;
		}
		
		/**
		 * Removes the components chidlren and all its internal references.
		 */		
		public function dispose(): void
		{
			_tag = null;
		}
		
		/**
		 * The XML tag that has been used to define this component.
		 */		
		public function set tag( value: XML ): void
		{
			_tag = value;
		}
		
		public function set rows( value: uint ): void
		{
			_rows = value;
			targetHeight = tileSize * _rows;
		}
		
		public function set cols( value: uint ): void
		{
			_cols = value;
			targetWidth = tileSize * _cols;
		}
		
		/**
		 * The skin used to render this component.
		 * A call to <code>render()</code> is made if you set a skin for a component.
		 */		
		public function set skin( value: IFuiSkin ): void
		{
			tileSize = value.tileSize;
			
			targetWidth = tileSize * _cols;
			targetHeight = tileSize * _rows;
			
			build();
		}

		/**
		 * Masks the component using the exact width and height calculated
		 * using the tile size and components size in tiles.
		 */		
		protected function maskComponent(): void
		{
			scrollRect = new Rectangle( 0, 0, targetWidth, targetHeight );
		}
		
		/**
		 * Draws the bounds of the component given by tile size and components size in tiles.
		 */
		protected function debugBounds(): void
		{
			graphics.lineStyle( 1, 0xff00ff );
			graphics.drawRect( 0, 0, targetWidth, targetHeight );
		}

		/**
		 * Creates and returns the string representation of the current object.
		 * 
		 * @return The string representation of the current object.
		 */		
		override public function toString(): String
		{
			return '[Component]';
		}
	}
}