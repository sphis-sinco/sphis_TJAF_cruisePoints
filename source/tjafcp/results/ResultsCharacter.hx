package tjafcp.results;

enum abstract ResultsCharacterID(String)
{
	var NONE = 'NONE';
	var TJ = 'TJ';
}

enum abstract ResultsCharacterName(String)
{
	var NONE = 'N/A';
	var TJ = 'TJ';
}

enum abstract ResultsCharacterAssetFolder(String)
{
	var NONE = '';
	var TJ = 'tj/';
}

class ResultsCharacter
{
	public var id:ResultsCharacterID = NONE;
	public var name:ResultsCharacterName = NONE;
	public var assetFolder:ResultsCharacterAssetFolder = NONE;

	public function new(id:ResultsCharacterID)
	{
		this.id = id;

		this.name = idToName(id);
		this.assetFolder = idToAssetFolder(id);
	}

	public static function idToName(id:ResultsCharacterID):ResultsCharacterName
	{
		if (id == TJ)
			return TJ;

		return NONE;
	}

	public static function idToAssetFolder(id:ResultsCharacterID):ResultsCharacterAssetFolder
	{
		if (id == TJ)
			return TJ;

		return NONE;
	}
}
