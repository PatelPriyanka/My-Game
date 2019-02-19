package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.*;
import flixel.ui.*;
import flixel.text.FlxText;

class MenuState extends FlxState
{
	var t:flixel.text.FlxText;
	var btn_Play:flixel.ui.FlxButton;
	var btn_Play1:flixel.ui.FlxButton;
	var developer:FlxText;
	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}  
	// function clickPlay1()
	// {
	// 	FlxG.switchState(new NextState(1));
	// }     

	override public function create():Void
	{
		//FlxG.cameras.flash(FlxColor.BLACK, 3);
		t = new FlxText(165,180, 300, "Welcome to Game World");
		t.setFormat(null,16,FlxColor.WHITE, CENTER);
		add(t);

		btn_Play = new FlxButton(150, 200, "Play Now", clickPlay);
		add(btn_Play);
		btn_Play.screenCenter();

		// btn_Play1 = new FlxButton(280, 300, "Play Now", clickPlay1);
		// add(btn_Play1);
		// btn_Play1.screenCenter();	
		
		developer = new FlxText(350,350, 200, "- Priyanka Patel");
		add(developer);

		super.create();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
