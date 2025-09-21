package tjafcp.results;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import haxe.macro.Compiler;
import tjafcp.results.ResultsCharacter.ResultsCharacterID;

class ResultsScreen extends FlxState
{
	public var score:ResultsScore;

	public var characterManager:ResultsCharacter;

	public override function new(?stats:ResultsStats, ?character:ResultsCharacterID = NONE)
	{
		super();

		if (stats == null)
		{
			trace('Null ResultsStats');
			stats = new ResultsStats(0, 0);
		}

		score = new ResultsScore(stats.good, stats.total);
		characterManager = new ResultsCharacter(character);
	}

	override function create()
	{
		super.create();

		var bgColor = "0xFFCC99";

		if (Compiler.getDefine('RESULTS_DONT_CHANGE_BGCOLOR') != '1')
		{
			if (characterManager.id == TJ)
				bgColor = "0x99CCFF";
		}

		add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.fromString(bgColor)));

		numbers = new FlxSpriteGroup();
		add(numbers);

		for (i in 0...3)
		{
			var number = new ResultsFont();
			number.animation.play('num 0');

			number.screenCenter();
			number.ID = i;

			if (i == 0)
				number.x -= number.width + 16;

			if (i == 2)
				number.x += number.width + 16;

			numbers.add(number);
		}
	}

	public var numbers:FlxSpriteGroup;
}
