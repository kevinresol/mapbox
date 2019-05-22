package mapbox;

import haxe.extern.EitherType;

typedef LngLatLike = EitherType<{lat:Float, lng:Float}, Array<Float>>;