package tjafcp;

import flixel.FlxG;
import flixel.FlxState;
import haxe.macro.Compiler;
import tjafcp.results.ResultsCharacter.ResultsCharacterID;
import tjafcp.results.ResultsScreen;
import tjafcp.results.ResultsStats;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		if (Compiler.getDefine('RESULTS_SCREEN') == '1')
		{
			var char = ResultsCharacterID.NONE;

			if (Compiler.getDefine('RESULTS_CHAR_TJ') == '1')
				char = ResultsCharacterID.TJ;

			if (Compiler.getDefine('RESULTS_EXCELLENT') == '1')
				FlxG.switchState(() -> new ResultsScreen(new ResultsStats(5, 5), char));
			else if (Compiler.getDefine('RESULTS_GREAT') == '1')
				FlxG.switchState(() -> new ResultsScreen(new ResultsStats(4, 5), char));
			else if (Compiler.getDefine('RESULTS_GOOD') == '1')
				FlxG.switchState(() -> new ResultsScreen(new ResultsStats(3, 5), char));
			else if (Compiler.getDefine('RESULTS_OKAY') == '1')
				FlxG.switchState(() -> new ResultsScreen(new ResultsStats(2, 5), char));
			else if (Compiler.getDefine('RESULTS_BAD') == '1')
				FlxG.switchState(() -> new ResultsScreen(new ResultsStats(1, 5), char));
			else
				FlxG.switchState(() -> new ResultsScreen(null, char));
		}
		else {}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
