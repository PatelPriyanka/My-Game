package;

import flixel.input.keyboard.FlxKey;
import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxSprite;

class Player2 extends FlxSprite 
{
	public static inline var GRAVITY:Int = 480;
	
	var _playerSpeed:Float = 120;
	var _playerJump:Float = 200;
	var _flagWalking:Bool = false;
//	public static inline var GRAVITY:Int = 480;
	
	public function new(X:Int, Y:Int, Parent:PlayState) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/aye.png", true, 32, 32);
		
		animation.add("idle", [0]);
		animation.add("walk1", [1, 2, 3, 4, 5, 6], 6, true);
		animation.add("walk2", [1, 2, 3, 4, 5, 6], 6, true,true);
		
		animation.add("down", [7]);
		animation.add("jump", [8]);
		animation.add("fall", [0]);
		
		acceleration.y = 420;
		maxVelocity.set(_playerSpeed, 420);
		drag.set(_playerSpeed , _playerSpeed );
		offset.set(3, 4);
		drag.set(140 * 4, 140 * 4);
		
	}
	
	public override function update(elapsed:Float):Void
	{

// Animations
		
		if (velocity.x > 0 || velocity.x < 0) 
		{ 
			if(FlxG.keys.anyPressed([RIGHT]))
			{
				animation.play("walk1");
			}           	
         	else if(FlxG.keys.anyPressed([LEFT]))
			{
				animation.play("walk2");
			}
			else
			{
				animation.play("walk1");
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


		if(FlxG.keys.anyPressed(["RIGHT"]))
		{
			velocity.x= 100;
			//player.acceleration.y = 0;
			
		}
		if(FlxG.keys.anyPressed(["LEFT"]))
		{
			velocity.x=-100;
			acceleration.y =GRAVITY;
		}

		if(FlxG.keys.anyPressed(["UP"]))
		{
			velocity.y= -100;
			acceleration.y =GRAVITY;
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
