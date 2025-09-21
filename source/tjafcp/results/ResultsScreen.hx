package tjafcp.results;

import flixel.FlxState;
import tjafcp.results.ResultsCharacter.ResultsCharacterID;

class ResultsScreen extends FlxState
{
	public var characterManager:ResultsCharacter;

	public override function new(?character:ResultsCharacterID = NONE)
	{
		super();

		characterManager = new ResultsCharacter(character);
	}
}
