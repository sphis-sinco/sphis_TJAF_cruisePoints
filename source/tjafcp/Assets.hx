package tjafcp;

enum abstract AssetFolders(String)
{
	var DEFAULT = '';
	var RESULTS = 'results/';
}

class Assets
{
	public static function getAssetPath(path:String, ?folder:AssetFolders = DEFAULT):String
	{
		if (!exists('assets/$folder$path'))
			trace('[WARNING]: cannot get path of ' + 'assets/$folder$path');
		return 'assets/$folder$path';
	}

	public static inline function getResultsPath(path:String, ?folder:AssetFolders = DEFAULT):String
		return getAssetPath(folder + path, RESULTS);

	public static inline function exists(path:String):Bool
		return #if sys sys.FileSystem.exists(path); #else lime.utils.Assets.exists(path); #end
}
