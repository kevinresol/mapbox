package mapbox;

@:jsRequire('mapbox-gl', 'LngLatBounds')
extern class LngLatBounds {
	function new(?sw:LngLatLike, ?ne:LngLatLike):Void;
	function isEmpty():Bool;
	function extend(?obj:LngLatLike):LngLatBounds;
	function toArray():Array<Array<Float>>;
}