extends Node2D



func _ready():
	pass # Replace with function body.

func spawnEnemies(node, playerLoc):
	var test = node.get_used_cells(0)
	test.sort()
	for g in LevelHandler.enemyQuant:
		for n in 100:
			var xcoord = randi_range(-70, 99)
			var ycoord = randi_range(-70, 99)
			
			if !( playerLoc.x <= xcoord -5 && playerLoc.x > xcoord+5 ) && !( playerLoc.y <= ycoord -5 && playerLoc.y > ycoord+5 ):
				
				var findMe = node.get_cell_atlas_coords(0,Vector2i(xcoord,ycoord),false)
		
				if findMe != Vector2i(0,0):
					print("success")
					var en = LevelHandler.get_enemy()#.instantiate()
					get_parent().get_parent().add_child.call_deferred(en)
					en.position = node.map_to_local(Vector2i(xcoord,ycoord))
					break
					
			else: print("failed")

		
	
	pass
