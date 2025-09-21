package tjafcp.results;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import haxe.macro.Compiler;
import tjafcp.results.ResultsCharacter.ResultsCharacterID;

class ResultsScreen extends FlxState
{
	public var stats:ResultsStats;
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
		this.stats = stats;
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

		percent.scale.set(.5, .5);
		percent.updateHitbox();
		percent.animation.play('%');
		percent.screenCenter();

		for (i in 0...3)
		{
			var number = new ResultsFont();
			number.scale.set(.5, .5);
			number.updateHitbox();
			number.animation.play('0');

			number.screenCenter();
			number.ID = i;

			if (i == 0)
				number.x -= number.width + 16;

			if (i == 2)
			{
				number.x += number.width + 16;
				percent.x = number.x + percent.width + 16;
			}

			numbers.add(number);
		}

		add(percent);
	}

	public var numbers:FlxSpriteGroup;

	public var percent:ResultsFont = new ResultsFont('symbols');

	public var percentNumber:Float = 0;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		percentNumber = FlxMath.lerp(percentNumber, (stats.good / stats.total) * 100, 1 / 1000);

		for (number in numbers)
		{
			var ppercentNumber = Std.int(percentNumber);
			if (ppercentNumber >= 100 && number.ID == 2)
				number.animation.play(Std.string(ppercentNumber).charAt(3));
			if (ppercentNumber >= 10 && number.ID == 1)
				number.animation.play(Std.string(ppercentNumber).charAt(2));
			if (number.ID == 0)
				number.animation.play(Std.string(ppercentNumber).charAt(1));
		}
	}
}
