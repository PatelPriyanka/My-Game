package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Bullet extends FlxSprite 
{
	public function new() 
	{
		super();
		
		loadGraphic("assets/images/bullet.png", false);
		exists = false; 
	}
	
	override public function update(elapsed:Float):Void 
	{
		if (!alive && animation.finished) 
		{
			exists = false;   
		}
		
		if (getScreenPosition().x < -64 || getScreenPosition().x > FlxG.width + 64) 
		{ 
			kill(); 
		} 
		else if (touching != 0)
		{
			kill(); 
		}
		else
		{
			super.update(elapsed);
		}
	}
	
	public function shoot(X:Int, Y:Int, VelocityX:Int, VelocityY:Int):Void
	{
		super.reset(X, Y);  
		
		solid = true;
		velocity.x = VelocityX;
		velocity.y = VelocityY;
	}
	
	public function angleshoot(X:Int, Y:Int, Speed:Int, Target:FlxPoint):Void
	{
		super.reset(X, Y);
		
		solid = true;
		var rangle:Float = Math.atan2(Target.y - (y + (height / 2)), Target.x - (x + (width / 2)));  //This gives angle in radians
		velocity.x = Math.cos(rangle) * Speed;
		velocity.y = Math.sin(rangle) * Speed;
	}
}