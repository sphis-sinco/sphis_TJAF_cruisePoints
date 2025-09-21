package tjafcp.results;

class ResultsStats
{
	public var good:Int;
	public var total:Int;

	public function new(good:Int, total:Int)
	{
		this.good = good;
		this.total = total;
	}

	public function toString():String
		return 'ResultsStats(good: ' + good + ', total: ' + total + ')';
}
