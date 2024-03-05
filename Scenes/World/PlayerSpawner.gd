extends Node2D

@onready var player = load("res://AcerolaAberationDungeonMartian/Player/Player.tscn").instantiate()



func SpawnPlayer(node):
	var test = node.get_used_cells(0)
	test.sort()

	for g in range( test.size()):
		var findMe = node.get_cell_atlas_coords(0,test[g],false)


		if findMe != Vector2i(1,0):
			$"../EnemySpawner".spawnEnemies(node, test[g])
			get_parent().get_parent().add_child.call_deferred(player)
			player.position = node.map_to_local(test[g])
			
			break
		else: pass
	pass
