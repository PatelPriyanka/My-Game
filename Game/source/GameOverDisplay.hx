
package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class GameOverDisplay extends FlxState
{
	
	var developer:FlxText;
	var _title:flixel.text.FlxText;
	var X:Int;
	var y1:flixel.text.FlxText;
	var y2:flixel.text.FlxText;
	var y3:flixel.text.FlxText;
	var _btnPlay1:FlxButton;
	var _btnPlay2:FlxButton;
	var _btnPlay3:FlxButton;

	public function new(X:Int) 
	{
		this.X=X;
		super(X);
		
	}

	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}

	var gameOver:FlxText;
	
	override public function create():Void
	{

		FlxG.mouse.visible=true;
	// 	FlxG.cameras.flash(FlxColor.BLACK, 3);
	// 	_title = new FlxText(165,180, 300, "Welcome to Game World");
	// //	_title.setFormat(null,16,FlxColor.WHITE, CENTER);
	// 	add(_title);

		//trace("hello");

	
		if(X == 0)
		{
			y2 = new FlxText(165,180, 300, "No one Won");
			y2.setFormat(null,16,FlxColor.WHITE, CENTER);
			add(y2);
		
		 	_btnPlay1 = new FlxButton(150, 200, "PlayNow", clickPlay);
			add(_btnPlay1);
			_btnPlay1.screenCenter();	


			gameOver=new FlxText(165,180, 400, "GAME OVER!!!");
			add(gameOver);	
			
	 	}
		if(X == 1)
		{
			y2=new FlxText(175,180, 300, "Player 1 Won");
			add(y2);
		
	 		_btnPlay2 = new FlxButton(150, 200, "PlayNow", clickPlay);
			add(_btnPlay2);
			_btnPlay2.screenCenter();	


			gameOver=new FlxText(200,FlxG.height/2-50, FlxG.width/2, "GAME OVER!!!");
			add(gameOver);
	 	}
		if(X == 2)
		{
			y3=new FlxText(175,180, 300, "Player 2 Won ");
			add(y3);
		
	 		_btnPlay3 = new FlxButton(150, 200, "PlayNow", clickPlay);
			add(_btnPlay3);
			_btnPlay3.screenCenter();	

			gameOver=new FlxText(200,FlxG.height/2-50, FlxG.width/2, "GAME OVER!!!");
			add(gameOver);
	 	}
		super.create();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
