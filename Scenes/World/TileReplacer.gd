extends Node2D

var compScreen = load("res://AcerolaAberationDungeonMartian/Scenes/World/ComputerLog.tscn").instantiate()

func TileReplacer(tileMap, playerLoc):
	if LevelHandler.curLevel == 1 || LevelHandler.curLevel == 2 ||LevelHandler.curLevel == 3:
		for i in 50:
			for n in 100:
				var xcoord = randi_range(-70, 99)
				var ycoord = randi_range(-70, 99)
				
				var findMe = tileMap.get_cell_atlas_coords(0,Vector2i(xcoord,ycoord),false)
				if findMe != Vector2i(0,0):
					tileMap.set_cell(0, Vector2i(xcoord,ycoord), 0, Vector2i(2,0))
					break
	if LevelHandler.curLevel == 1 || LevelHandler.curLevel == 2:
		for n in 100:
			
			var xcoord = randi_range(-70, 99)
			var ycoord = randi_range(-70, 99)
			if !( playerLoc.x <= xcoord -5 && playerLoc.x > xcoord+5 ) && !( playerLoc.y <= ycoord -5 && playerLoc.y > ycoord+5 ):
				var findMe = tileMap.get_cell_atlas_coords(0,Vector2i(xcoord,ycoord),false)
				if findMe != Vector2i(0,0):
					tileMap.set_cell(0, Vector2i(xcoord,ycoord), 0, Vector2i(3,0))
					get_parent().get_parent().add_child.call_deferred(compScreen)
					compScreen.global_position = tileMap.map_to_local(Vector2i(xcoord,ycoord))
					break
