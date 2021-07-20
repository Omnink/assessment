package objects;

import flixel.group.FlxSpriteGroup;
import flixel.util.FlxTimer;
import js.html.Console;
import objects.MemoryTile;

class MemoryTileMap extends FlxSpriteGroup
{
	static inline var TILE_WIDTH:Int = 96;
	static inline var TILE_HEIGHT:Int = 96;
	static inline var TILE_GAP:Int = 16;
	static inline var ROWS:Int = 4;
	static inline var COLS:Int = 5;

	var tileData:Array<Array<MemoryTile>>;

	public function new(x:Float, y:Float):Void
	{
		super(x, y);
		buildMap();
	}

	public function buildMap():Void
	{
		tileData = [for (x in 0...10) [for (y in 0...10) null]];

		for (y in 0...ROWS)
		{
			for (x in 0...COLS)
			{
				var tile = new MemoryTile((TILE_WIDTH * x) + (TILE_GAP * x), (TILE_HEIGHT * y) + (TILE_GAP * y), 0);
				add(tile);

				tileData[y][x] = tile;
			}
		}
	}

	public function printMap():Void
	{
		for (y in 0...ROWS)
		{
			var row:String = "";
			for (x in 0...COLS)
			{
				row += "0, ";
			}
			Console.log(row);
		}
	}

	public function setMap():Void
	{
		for (y in 0...ROWS)
		{
			for (x in 0...COLS) {}
		}
	}

	public function resetMapData():Void
	{
		for (y in 0...ROWS)
		{
			for (x in 0...COLS)
			{
				remove(tileData[y][x]);

				var tile = new MemoryTile((TILE_WIDTH * x) + (TILE_GAP * x), (TILE_HEIGHT * y) + (TILE_GAP * y), 0);
				add(tile);

				tileData[y][x] = tile;
			}
		}
	}
}
