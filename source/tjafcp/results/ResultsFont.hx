package tjafcp.results;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class ResultsFont extends FlxSprite
{
	override public function new(type:String = 'numbers')
	{
		super();

		var tex = FlxAtlasFrames.fromSparrow(Assets.getResultsPath('ui/font-' + type.toLowerCase() + '.png'),
			Assets.getResultsPath('ui/font-' + type.toLowerCase() + '.xml'));

		this.frames = tex;

		switch (type.toLowerCase())
		{
			case 'numbers':
				var nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

				for (num in nums)
				{
					this.animation.addByPrefix('' + num, 'num ' + num, 24);
				}
			case 'symbols':
				var symbols = ['%'];

				for (symbol in symbols)
				{
					this.animation.addByPrefix(symbol, 'symbol ' + symbol, 24);
				}
			default:
				trace('unknown results font suffix: ' + type);
		}
	}
}
