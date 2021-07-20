package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.effects.chainable.FlxGlitchEffect;
import flixel.graphics.FlxGraphic;
import flixel.system.FlxSound;
import flixel.tile.FlxTilemap;
import flixel.util.FlxTimer;
import objects.MemoryTileMap;

class MemoryMatchState extends FlxState
{
	var tiles:MemoryTileMap;

	override public function create()
	{
		super.create();

		FlxG.autoPause = false;
		FlxG.sound.play(AssetPaths.mm_1__wav, 1, false, null, true, showTileMap);
		// new FlxTimer().start(10, showTileMap);
	}

	function showTileMap():Void
	{
		tiles = new MemoryTileMap(120, 76, 5);
		add(tiles);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
