package tjafcp.results;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
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

		var bgColor = 0xFFCC99;

		if (Compiler.getDefine('RESULTS_DONT_CHANGE_BGCOLOR') != '1')
		{
			if (characterManager.id == TJ)
				bgColor = 0x99CCFF;
		}

		add(new FlxSprite().makeGraphic(FlxG.width, FlxG.height, bgColor));
	}
}
