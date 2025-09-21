package tjafcp.results;

import flixel.FlxState;
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
}
