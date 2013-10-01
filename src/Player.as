package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import utils.draw.Squar;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Player extends Sprite
	{
		private var _speedup:Point = new Point(0,1);
		private var _speed:Point = new Point(0, 0);
		public var canmove:Boolean = false;
		private var _art:Squar;
		public function Player($x:Number,$y:Number) 
		{
			this.x = $x;
			this.y = $y;
			
			var res:Number = Main.MAIN.level.res;
			_art = new Squar(0, 0, res, res, 0xff00ff);
			addChild(_art);
			
			trace("placed player");
		}
		
		public function move():void
		{
			_speed.x += _speedup.x;
			if (canmove==true)
			{
				_speed.y += _speedup.y;
				_speed.y = 0;
			}
			
			this.x += _speed.x;
			this.y += _speed.y;
		}
		
		public function get speedup():Point
		{
			return _speedup;
		}
		
		public function set speedup(value:Point):void 
		{
			_speedup = value;
		}
	}

}