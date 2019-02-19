package;


import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Gmo extends FlxState
{
	var t:flixel.text.FlxText;
	var btn_Play:flixel.ui.FlxButton;
	var btn_Play1:flixel.ui.FlxButton;
	var developer:FlxText;
	//var X:Int;
	var X:Int;
	public function new(X:Int) 
	{
		this.X=X;
		super(X);
	}

	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}  

	override public function create():Void
	{
		FlxG.mouse.visible=true;
		if(X==0)
		{
			t = new FlxText(165,180, 300, "No one Won");
			t.setFormat(null,16,FlxColor.WHITE, CENTER);
			add(t);
		}
		else if(X==1)
		{
			t = new FlxText(165,180, 300, "Player 1 Won");
			t.setFormat(null,16,FlxColor.WHITE, CENTER);
			add(t);
		}
		else if(X==2)
		{
			t = new FlxText(165,180, 300, "Player 2 Won");
			t.setFormat(null,16,FlxColor.WHITE, CENTER);
			add(t);
		}
		//FlxG.cameras.flash(FlxColor.BLACK, 3);
		

		btn_Play = new FlxButton(150, 200, "Next Play", clickPlay);
		add(btn_Play);
		btn_Play.screenCenter();

		// btn_Play1 = new FlxButton(280, 300, "Next Level", clickPlay);
		// add(btn_Play1);
		//btn_Play1.screenCenter();	
		
		developer = new FlxText(350,350, 200, "- Priyanka Patel");
		add(developer);

		super.create();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
