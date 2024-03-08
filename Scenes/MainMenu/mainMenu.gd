extends Node2D



func _ready():
	InventoryHandler.upgrades  = {"Tentaclular Brachium" = 0, "Haptic Perception" = 0, Pulmonatization = 0, Radula = 0, Arachnopod = 0, Aposematism = 0}
	LevelHandler.curLevel =1 
	LevelHandler.curLoop = 0
	LevelHandler.enemyQuant = 10
	#print(InventoryHandler.upgrades)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")



func _on_options_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	
