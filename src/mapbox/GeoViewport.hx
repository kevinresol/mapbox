package mapbox;

@:jsRequire('@mapbox/geo-viewport')
extern class GeoViewport {
	static function viewport(points:Array<Float>, size:Array<Int>):{center:Array<Float>, zoom:Float};
}