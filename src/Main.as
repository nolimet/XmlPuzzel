package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import utils.loaders.XML_Loader;
	//import Level;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Main extends Sprite 
	{
		public static var MAIN:Main;
		private var _level:Level;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_level = new Level("lvl1");
			addChild(_level);
			MAIN = this
		}
		
		public function get level():Level 
		{
			return _level;
		}
		
	}
	
}