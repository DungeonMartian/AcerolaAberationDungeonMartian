extends Node2D

var tilemap : TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	tilemap = get_parent().get_node("TileMap")
	for child in get_children():
		if child.has_method("calculate_path"):
			child.calculate_path(tilemap, 1000)
		elif child.has_method("SpawnPlayer"):
			child.SpawnPlayer(tilemap)


