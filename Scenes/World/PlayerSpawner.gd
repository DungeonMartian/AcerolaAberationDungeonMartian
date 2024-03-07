extends Node2D

@onready var player = load("res://AcerolaAberationDungeonMartian/Player/Player.tscn").instantiate()



func SpawnPlayer(node):
	var test = node.get_used_cells(0)
	test.sort()

	for g in range( test.size()):
		var findMe = node.get_cell_atlas_coords(0,test[g],false)


		if findMe != Vector2i(0,0):
			$"../EnemySpawner".spawnEnemies(node, test[g])
			$"../TileReplacer".TileReplacer(node, test[g])
			get_parent().get_parent().add_child.call_deferred(player)
			
			if LevelHandler.curLevel ==1:
				node.set_cell(0, test[g], 0, Vector2i(4,0))
			
			player.position = node.map_to_local(test[g])
			
			break
		else: pass
	pass
