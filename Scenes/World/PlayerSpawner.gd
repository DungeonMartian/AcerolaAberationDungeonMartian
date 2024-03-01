extends Node2D

@onready var player = load("res://AcerolaAberationDungeonMartian/Player/Player.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func SpawnPlayer(node):
	var test = node.get_used_cells(0)
	test.sort()

	for g in range( test.size()):
		var findMe = node.get_cell_atlas_coords(0,test[g],false)


		if findMe == Vector2i(0,0):

			get_parent().get_parent().add_child.call_deferred(player)
			player.position = node.map_to_local(test[g])
			break
		else: pass
	pass
