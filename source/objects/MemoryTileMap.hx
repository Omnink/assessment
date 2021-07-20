package objects;

import flixel.group.FlxSpriteGroup;
import flixel.math.FlxRandom;
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

	var tileData:Array<Array<Bool>>;
	var tiles:Array<Array<MemoryTile>>;

	public function new(x:Float, y:Float, numActiveTiles:Int):Void
	{
		super(x, y);

		buildMap(numActiveTiles);
		startTimer(3);
	}

	public function startTimer(seconds:Float):Void
	{
		new FlxTimer().start(seconds, hideMap);
	}

	function hideMap(timer:FlxTimer):Void
	{
		Console.log("WE DID IT");

		for (y in 0...ROWS)
		{
			for (x in 0...COLS)
			{
				// Clear tiles
				remove(tiles[y][x]);
				tiles[y][x] = null;

				// Show tiles
				var tile:MemoryTile;
				tile = new MemoryTile((TILE_WIDTH * x) + (TILE_GAP * x), (TILE_HEIGHT * y) + (TILE_GAP * y), 0);
				tile.clickable = true;
				add(tile);
				tiles[y][x] = tile;
			}
		}
	}

	public function setData(numActiveTiles:Int):Void
	{
		var count:Int = 0;
		tileData = [for (x in 0...10) [for (y in 0...10) false]];
		while (count < numActiveTiles)
		{
			var x:Int = 0;
			var y:Int = 0;

			var random:FlxRandom = new FlxRandom();
			x = random.int(0, 4);
			y = random.int(0, 3);

			if (tileData[y][x] == false)
			{
				tileData[y][x] = true;
				count++;
			}
		}
	}

	public function buildMap(numActiveTiles:Int):Void
	{
		setData(numActiveTiles);

		tiles = [for (x in 0...10) [for (y in 0...10) null]];

		for (y in 0...ROWS)
		{
			for (x in 0...COLS)
			{
				var tile:MemoryTile;

				if (tileData[y][x])
				{
					tile = new MemoryTile((TILE_WIDTH * x) + (TILE_GAP * x), (TILE_HEIGHT * y) + (TILE_GAP * y), 1);
				}
				else
					tile = new MemoryTile((TILE_WIDTH * x) + (TILE_GAP * x), (TILE_HEIGHT * y) + (TILE_GAP * y), 0);

				add(tile);

				tiles[y][x] = tile;
			}
		}
	}
}
