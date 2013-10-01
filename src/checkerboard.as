package  
{
	import utils.draw.Squar;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author ...
	 */
	public class checkerboard extends Sprite
	{
		public var w:Boolean = false
		public var world:Array = new Array(9);
		private var possX:int;
		private var possY:int;
		private var playfield:int = 9;
		public function checkerboard() 
		{
			var size:Number = 40
			var s:Squar;
			var c:uint;
			var t:String = "";
			
			for (var i:int = 0; i < playfield; i++) 
			{
				var row:Array=[]
				for (var j:int = 0; j < playfield; j++) 
				{
					
					if (w)
					{
						w = false;
						c = 0x00ff00;
						t = "red";
					}
					else
					{
						w= true;
						c = 0x000000;
						t= "black";
					}
					s= new Squar(j * size, i * size, size, size, c, 2, t);
					addChild(s);
					row.push(s);
				}
				//trace(row);
				world[i] = row;
			}
		}
		
		public function move(side:String="" ):void
		{
			if (side == "up" && possX>0)
			{
				trace(world[possX + 1][possY + 0]);
				possX++
				
			}
			if (side == "down" && possX<playfield)
			{
				trace(world[possX - 1][possY + 0]);
				possX--
			}
			if (side == "left" && possX>0)
			{
				trace(world[possX + 0][possY - 1]);
				possY--
			}
			if (side == "rigt" && possY < playfield)
			{
				trace(world[possX + 0][possY + 1]);
				possY++
			}
		}
		
		
	}

}