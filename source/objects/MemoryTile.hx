package objects;

import flixel.FlxG;
import flixel.addons.display.FlxExtendedSprite;
import flixel.util.FlxColor;
import js.html.Console;

class MemoryTile extends FlxExtendedSprite
{
	public var type:Int = -1;

	var typeColor:FlxColor;

	public function new(x:Float, y:Float, type:Int):Void
	{
		super(x, y);

		clickable = true;
		this.type = type;
		switch (this.type)
		{
			case 0:
				typeColor = FlxColor.WHITE;
			case 1:
				typeColor = FlxColor.GREEN;
		}

		makeGraphic(96, 96, typeColor);
	}

	override public function update(timeElapsed:Float):Void
	{
		super.update(timeElapsed);
	}
}
