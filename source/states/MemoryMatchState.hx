package states;

import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import flixel.graphics.FlxGraphic;
import flixel.tile.FlxTilemap;
import objects.MemoryTileMap;

class MemoryMatchState extends FlxState
{
	var tiles:MemoryTileMap;

	override public function create()
	{
		super.create();

		tiles = new MemoryTileMap(120, 76);
		add(tiles);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
