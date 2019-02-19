package;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxSprite;

class Coin extends FlxSprite 
{
	 public function new(X:Float=0, Y:Float=0) 
 {
     super(X, Y);
     loadGraphic(AssetPaths.i11__png, false, 8, 8);
 }	
}