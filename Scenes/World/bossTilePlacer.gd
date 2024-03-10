extends Node2D



func _ready():
	pass # Replace with function body.



func bossTiles(tileset):
	var tm : TileMap = tileset 
	var pattern0 = tm.tile_set.get_pattern(0)
	var pattern1 = tm.tile_set.get_pattern(1)
	if LevelHandler.curLevel ==3:
		tileset.set_pattern(0, Vector2i(0,0), pattern0)

	if LevelHandler.curLevel == 6:
		tileset.set_pattern(0, Vector2i(0,0), pattern1)


