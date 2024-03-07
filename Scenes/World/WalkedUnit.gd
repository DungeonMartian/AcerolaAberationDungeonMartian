extends Node2D

var tilemap: TileMap
#var pathLength := 100
enum dirs {LEFT, RIGHT, UP, DOWN}
const tileSize := 32



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func calculate_path(node, length):
	var pathSteps := []
	for i in length:
		var step := randi_range(0,3)
		pathSteps.append(step)
		
	var location : Vector2 = get_parent().global_position
	var tm : TileMap = node

	for dir in pathSteps:
		var modifierDirection : Vector2
		
		match dir:
			0:
				modifierDirection = Vector2.LEFT
			1:
				modifierDirection = Vector2.RIGHT
			2:
				modifierDirection = Vector2.UP
			3:
				modifierDirection = Vector2.DOWN
		location += modifierDirection * tileSize
		#print(location)
		var mapCords := tm.local_to_map(location)
		if LevelHandler.curLevel == 1 || LevelHandler.curLevel == 2 ||LevelHandler.curLevel == 3:
			tm.set_cell(0, mapCords, 0, Vector2(1,0))
		elif LevelHandler.curLevel == 4 || LevelHandler.curLevel == 5 ||LevelHandler.curLevel == 6 ||LevelHandler.curLevel == 7:
			tm.set_cell(0, mapCords, 0, Vector2(randi_range(5,6),0))
