package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixec.util.*;
import flixel.util.FlxSpriteUtil;
import flixel.FlxG;
using flixel.util.FlxSpriteUtil;
import openfl.display.Graphics;

 class Wall extends FlxSprite {
	
	public function new (X, Y,A,B) 
	{
		super(X,Y);
		makeGraphic(A,B,FlxColor.TRANSPARENT);
		immovable=true;
		

	}


	override public function update (elapsed:Float)
	{
		super.update(elapsed);	
	}
		
}