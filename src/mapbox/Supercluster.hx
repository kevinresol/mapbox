package mapbox;

import geojson.*;

@:jsRequire('supercluster', 'default')
extern class Supercluster<Properties:{}, Reduced> {
	function new(?opt:SuperclusterOptions<Properties, Reduced>);
	function load(points:Array<Feature<Point, Properties>>):Void;
	function getClusters(bbox:Array<Float>, zoom:Float):Array<PointOrCluster<Properties>>;
	function getTile(zoom:Float, x:Float, y:Float):Any;
	function getChildren(clusterId:Int):Array<Any>;
	function getLeaves(clusterId:Int, ?limit:Int, ?offset:Int):Array<Feature<Point, Properties>>;
	function getClusterExpansionZoom(clusterId:Int):Float;
}

@:forward
abstract PointOrCluster<Properties:{}>(Feature<Point,Properties>) {
	public var isCluster(get, never):Bool;
	inline function get_isCluster():Bool return asCluster().properties.cluster == true;
	public inline function asPoint():Feature<Point, Properties> return this;
	public inline function asCluster():Feature<Point, ClusterProperties> return cast this;
}

typedef ClusterProperties = {
	cluster:Bool,
	cluster_id:Int,
	point_count:Int,
}

typedef SuperclusterOptions<Properties:{}, Reduced> = {
	?minZoom:Int,
    ?maxZoom:Int,
    ?radius:Int,
    ?extent:Int,
    ?nodeSize:Int,
    ?log:Bool,
    ?reduce:Reduced->Reduced->Reduced,
    ?map:Feature<Point,Properties>->Reduced,
}