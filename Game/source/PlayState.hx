package;

// Name :- Priyanka Patel
// Student ID:- 0883743

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.FlxCamera;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.editors.tiled.TiledMap;
import flixel.FlxObject;
import flixel.addons.*;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.input.keyboard.FlxKeyList;

import openfl.Assets;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.system.FlxAssets;

import openfl.display.FPS;
import openfl.Lib;

class PlayState extends FlxState
{

	var player: Player;	
	var player2: Player2;
	
	var map: FlxOgmoLoader;
	var m_Walls: FlxTilemap;

	var canShoot2: Bool;
	var canShoot1:Bool;
	var x: Int;

	var Score_text1:FlxText;
	var Score_text2:FlxText;

	var bullet_Player1:FlxSprite;
	var bullet_Player2: FlxSprite;
	
	var _badbullets:FlxTypedGroup<Bullet>;
	var _grpCoins:FlxTypedGroup<Coin>;

	var score_p1: Int;
	var score_p2: Int;
	public static inline var GRAVITY:Int = 420;

	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible=false;
		x=0;

	
		score_p1=50;
		score_p2=50;
		//FlxG.cameras.flash(FlxColor.BLACK);

		Score_text1=new FlxText(0,0, FlxG.width, "Score Player1 : "+ score_p1);
		Score_text1.setFormat(null,15, FlxColor.LIME,"left");			
		Score_text2=new FlxText(0,0, FlxG.width, "Score Player2: "+ score_p1);
		Score_text2.setFormat(null,15, FlxColor.LIME,"right");


		canShoot1=true;
		canShoot2=true;


		map = new FlxOgmoLoader("assets/ogmo/g_9.oel");
 		m_Walls = map.loadTilemap("assets/images/walls1.png", 16, 16, "wall");
 		m_Walls.follow();
 		m_Walls.setTileProperties(1, FlxObject.NONE);
 		m_Walls.setTileProperties(2, FlxObject.ANY);
 		add(m_Walls);


		_grpCoins = new FlxTypedGroup<Coin>();
		add(_grpCoins);
		map.loadEntities(placeEntities, "entities");

		player = new Player(112, 92, this);
		add(player);

 		player2= new Player2(580, 52, this);
 		add(player2);
 		//map.loadEntities(placeEntities, "Player");

 				// FlxG.camera.follow(player, TOPDOWN, 1);

 		bullet_Player1 = new FlxSprite(FlxG.width/2-5, FlxG.height-30);
		bullet_Player1.makeGraphic(9, 2, FlxColor.WHITE);
		bullet_Player1.visible = false;
		add(bullet_Player1);

		bullet_Player2 = new FlxSprite(FlxG.width/2-5, FlxG.height-30);
		bullet_Player2.makeGraphic(9, 2, FlxColor.WHITE);
		bullet_Player2.visible = false;
		add(bullet_Player2);

		add(Score_text2);
		add(Score_text1);


		#if flash
		FlxG.sound.playMusic("assets/music/ScrollingSpace.mp3", 0.5);
		#else
		FlxG.sound.playMusic("assets/music/ScrollingSpace.ogg", 0.5);
		#end

		 // FlxG.camera.follow(player, TOPDOWN, 1);

	}
//  Place the entities from map to our wall map
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player,m_Walls);
		FlxG.collide(player2,m_Walls);
		
		FlxG.collide(player2,player,Ovr);

		FlxG.collide(bullet_Player2,m_Walls, BWall2);
		FlxG.collide(bullet_Player1,m_Walls, BWall);
				
		FlxG.collide(bullet_Player1, player2, Hit1);
		FlxG.collide(bullet_Player2, player, Hit2);

		FlxG.overlap(player, _grpCoins, playerTouchCoin1);
		FlxG.overlap(player2, _grpCoins, playerTouchCoin2);

		// if(FlxG.overlap(player, _grpCoins))
		// {
		// 	score_p1+=10;
		// }
		// if(FlxG.overlap(player, _grpCoins))
		// {
		// 	score_p1+=10;
		// }

		if(FlxG.keys.justReleased.ENTER && canShoot2 == true)
		{
			canShoot2=false;
			bullet_Player2.exists=true;
			bullet_Player2.visible=true;
			bullet_Player2.x = player2.x+player2.width/2;
			bullet_Player2.y = player2.y+player2.height/2;
			var x = player2.x-player.x;
			if(x<0)
			{
				bullet_Player2.velocity.x= 1000;	
			}
			else
			{
				bullet_Player2.velocity.x= -1000;
			}
			FlxG.sound.play("assets/sounds/shoot2" + Reg.SoundExtension, 1, false);
		}

		if(FlxG.keys.justReleased.SPACE && canShoot1 == true){
			canShoot1=false;
			bullet_Player1.exists=true;
			bullet_Player1.visible=true;
			bullet_Player1.x = player.x+player.width/2;
			bullet_Player1.y = player.y+player.height/2;
			var x = player2.x-player.x;
			if(x>0)
			{
				bullet_Player1.velocity.x= 1000;	
			}
			else
			{
				bullet_Player1.velocity.x= -1000;
			}
			FlxG.sound.play("assets/sounds/shoot2" + Reg.SoundExtension, 1, false);
		}

		// if(score_p2<=0 || score_p1<=0)
		// {

			if(score_p1<=0)
			{
				x=2;
				FlxG.switchState( new Gmo(x));
			}
			else if(score_p2<=0)
			{
				x=1;
				FlxG.switchState( new Gmo(x));
			}
		
	
			if(score_p2>=650)
			{
				x=2;
				FlxG.switchState( new Gmo(x));
			}
			if(score_p1>=650)
			{
				x=1;
				FlxG.switchState( new Gmo(x));
			}

		// if(score_p1<=0)
		// 	{
		// 		x=2;
		// 		FlxG.switchState( new GameOverDisplay(2));
		// 	}
		// 	else if(score_p2<=0)
		// 	{
		// 		x=1;
		// 		FlxG.switchState( new GameOverDisplay(1));
		// 	}
			
		
		// 	if(score_p2>=650)
		// 	{
		// 		x=2;
		// 		FlxG.switchState( new GameOverDisplay(2));
		// 	}
		// 	if(score_p1>=650)
		// 	{
		// 		x=1;
		// 		FlxG.switchState( new GameOverDisplay(1));
		// 	}

			
		
		

		
}

	function playerTouchCoin1(P:Player, C:Coin):Void
	{
    	if (P.alive && P.exists && C.alive && C.exists)
    	{
        	C.kill();
        	score_p1+=10;
        	Score_text1.text="Score Player1:" + score_p1;
        	FlxG.sound.play("assets/sounds/coin" + Reg.SoundExtension, 3, false);
    	}
	}
	function playerTouchCoin2(P:Player, C:Coin):Void
	{
    	if (P.alive && P.exists && C.alive && C.exists)
    	{
        	C.kill();
        	score_p2+=10;
        	Score_text2.text="Score Player2:" + score_p2;
        	FlxG.sound.play("assets/sounds/coin" + Reg.SoundExtension, 3, false);
    	}
	}

	function BWall(Bullet:FlxObject, Wall:FlxObject):Void{
		Bullet.exists=false;
		
		canShoot1=true;
	}

	function BWall2(Bullet:FlxObject, Wall:FlxObject):Void
	{
		Bullet.exists=false;
		canShoot2=true;
	}

	function Hit1(Bullet:FlxObject, Player:FlxObject):Void
	{
		Bullet.exists=false;
		canShoot1=true;
		score_p2-=50;
		Score_text2.text="Score Player2:" + score_p2;
				FlxG.sound.play("assets/sounds/death" + Reg.SoundExtension, 1, false);
		
	}

	function Hit2(Bullet:FlxObject, Player:FlxObject):Void
	{
		Bullet.exists=false;
		canShoot2=true;
		score_p1-=50;
		Score_text1.text="Score Player1:" + score_p1;
				FlxG.sound.play("assets/sounds/death" + Reg.SoundExtension, 1, false);
		
	}
		
	function Ovr(Player1:FlxObject, Player2:FlxObject):Void
	{
		x=0;
		FlxG.switchState( new Gmo(x));
	}
	function placeEntities(entityName:String, entityData:Xml):Void
 	{
    	var x:Int = Std.parseInt(entityData.get("x"));
     	var y:Int = Std.parseInt(entityData.get("y"));
     	if (entityName == "player")
     	{
        	player.x = x;
         	player.y = y;
     	}
     	 else if (entityName == "coin")
 		{
    		 _grpCoins.add(new Coin(x-2, y-2));
 		}
 	}


}
