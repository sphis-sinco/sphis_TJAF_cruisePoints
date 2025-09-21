package tjafcp;

import flixel.FlxG;
import flixel.FlxState;
import haxe.macro.Compiler;
import tjafcp.results.ResultsScreen;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		if (Compiler.getDefine('RESULTS_SCREEN') == '1')
		{
			FlxG.switchState(() -> new ResultsScreen());
		}
		else {}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
