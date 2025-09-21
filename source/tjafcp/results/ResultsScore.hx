package tjafcp.results;

class ResultsScore
{
	// 0 - 5
	// 0 - TERRIBLE
	// 1 - BAD
	// 2 - OKAY
	// 3 - GOOD
	// 4 - GREAT
	// 5 - EXCELLENT
	public var ranking_score:Int;

	public var ranking_phrase:String;

	public function new(good:Int, total:Int)
	{
		reload(good, total);
	}

	public static function staticReload(good:Int, total:Int):ResultsScore
		return new ResultsScore(good, total);

	public function reload(good:Int, total:Int)
	{
		ranking_score = Std.int((Std.int(good / total) * 100) / 20);

		switch (ranking_score)
		{
			default:
				ranking_phrase = 'TERRIBLE';
			case 1:
				ranking_phrase = 'BAD';
			case 2:
				ranking_phrase = 'OKAY';
			case 3:
				ranking_phrase = 'GOOD';
			case 4:
				ranking_phrase = 'GREAT';
			case 5:
				ranking_phrase = 'EXCELLENT';
		}
	}
}
