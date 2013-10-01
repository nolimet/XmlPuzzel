package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.text.TextField;
	import flash.events.Event
	import flash.net.URLRequest;
	import utils.draw.Squar;
	import Player;
	import utils.loaders.XML_Loader;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Level extends Sprite
	{
		private var _maze:Array = [];
		private var _gui:TextField;
		private var _levelXML:XML;
		private var _objects:XML_Loader;
		private var _loader:URLLoader;
		private var _player:Player;
		private var _res:Number;
		
		public function Level(lvl:String) 
		{
			_objects = new XML_Loader("XML/objects.xml");
			_XML_Loader("lvl1");
			//_player=new Player(
			addEventListener(Event.ENTER_FRAME, step);
			//buildworld()
		}
		
		private function step(e:Event):void
		{
			try{
				for (var i:int = 0; i < _maze.length; i++) 
				{
					//if (itemHitArrItem(_player, _maze))
					if (_player.hitTestObject(_maze[i]))
					//if (_maze[i - 1].hitTestObject(_player))
					{
						_player.canmove = true;
						trace(_player.canmove);
					}
					else
					{
						_player.canmove = false;
						trace(_player.canmove);
					}
					
				}
				
				_player.move();
			}catch (e:Error) {
				//trace("with player: " + e.message);
				//trace("maze content: " + _maze);
			}
		}
		private function _XML_Loader($url:String):void
		{
			_loader = new URLLoader (new URLRequest("XML/" + $url + ".xml"));
			_loader.addEventListener(Event.COMPLETE, onXMLLoad, false, 0, true);
		}
		
		private function onXMLLoad(e:Event):void 
		{
			_levelXML = XML(e.target.data);
			trace("cookie")
			buildworld();
		}
		
		private function buildworld():void
		{
			var s:Squar;
			var st:int;
			var validBlock:Boolean;
			var ids:int = _objects.loaded.blockIDs.@totalIDs;
			_res = _levelXML.@reso;
			//trace(_levelXML.stone.@color);
			for (var i:int = 0; i < _levelXML.@rows; i++) 
			{
				for (var j:int = 0; j < _levelXML.@cols; j++) 
				{
					try {
						st = _levelXML.row[i].c[j]
						validBlock = false;
						for (var k:int = 0; k < ids; k++) 
						{
							if ( st == k && st != 0 && st != 1 && validBlock == false)
							{
								s = new Squar(res * j, res * i, res, res, _objects.loaded.blockIDs.ID[k].@color, _objects.loaded.blocks.stone.@linewidth, "bedrock");
								addChild(s);
								_maze.push();
								validBlock = true;
							}
							else if (st == k&& st != 0 && validBlock==false)
							{
								_player = new Player(res * j, res * i);
								addChild(_player);
								validBlock=true
							}
							//else if (st != 0  && st != 1 && validBlock == false)
							//{
								//trace("Block ID: " + st + " is nowt valid");
								//trace("At collum: " + j + " Row: " + i);
							//}
						}
					}catch (error:Error)
					{
						trace("Error while reading xml back at collum: "+j+" Row: "+i);
					}
				}
			}
		}
		
		public function get loaded():XML 
		{
			return _levelXML;
		}
		
		public function get res():Number 
		{
			return _res;
		}
	}
}