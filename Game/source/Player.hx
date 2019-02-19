package;

import flixel.input.keyboard.FlxKey;
import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxSprite;

class Player extends FlxSprite 
{
	public static inline var GRAVITY:Int = 480;
	
	
	public function new(X:Int, Y:Int, Parent:PlayState) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/lizardhead3.png", true, 16, 20);
		
		animation.add("walking1", [0, 1, 2, 3], 12, true);
		animation.add("walking2", [0, 1, 2, 3], 12, true,true);
		animation.add("idle", [3]);
		animation.add("jump", [2]);
		animation.add("fall", [3]);
		
		maxVelocity.set(140, 480);
		acceleration.y = 480;
		setSize(10, 20);
		offset.set(3, 4);

		drag.set(140 * 4, 140 * 4);
		
	}
	
	public override function update(elapsed:Float):Void
	{

// Animations
		
		if (velocity.x > 0 || velocity.x < 0) 
		{ 
			if(FlxG.keys.anyPressed([D]))
			{
				animation.play("walking1");
			}           	
         	else if(FlxG.keys.anyPressed([A]))
			{
				animation.play("walking2");
			}
			else
			{
				animation.play("walking1");
			}
		}
		
		else if (velocity.x == 0) 
		{ 
			animation.play("idle"); 
		}
		if (velocity.y < 0) 
		{ 
			animation.play("jump"); 
		}
		if (velocity.y > 0)
		{
			animation.play("fall");
		}

		if(FlxG.keys.anyPressed(["D"]))
		{
			velocity.x= 130;
			animation.play("walking1");
		}
		if(FlxG.keys.anyPressed(["A"]))
		{
			velocity.x=-130;
			acceleration.y =GRAVITY;
			animation.play("walking2");
		}

		if(FlxG.keys.anyPressed(["W"]))
		{
			velocity.y= -130;
			acceleration.y =GRAVITY;
			animation.play("jump"); 
			FlxG.sound.play("assets/sounds/jump" + Reg.SoundExtension, 1, false);
		}
		// if(FlxG.keys.anyPressed(["S"])){
		// 	player.velocity.y= 100;
		// }
		
		
		super.update(elapsed);
	}
	
	override public function kill():Void
	{
		
		FlxG.sound.play("assets/sounds/death" + Reg.SoundExtension, 1, false);
	}
}
