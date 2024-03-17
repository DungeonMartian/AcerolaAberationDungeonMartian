extends Node2D

var tilemap : TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	tilemap = get_parent().get_node("TileMap")
	for child in get_children():
		if child.has_method("calculate_path"):
			if LevelHandler.curLoop == 0:
				if LevelHandler.curLevel >4:
					child.calculate_path(tilemap, 500)
				if LevelHandler.curLevel <=4:
					child.calculate_path(tilemap, 700)
			else:
				child.calculate_path(tilemap, 900)
		#elif child.has_method("TileReplacer"):
		#	child.TileReplacer(tilemap)
		elif child.has_method("SpawnPlayer"):
			child.SpawnPlayer(tilemap)
		else:
				$bossTilePlacer.bossTiles(tilemap)



