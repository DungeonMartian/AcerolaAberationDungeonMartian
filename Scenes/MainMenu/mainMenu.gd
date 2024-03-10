extends Node2D

var time : float

func _ready():
	InventoryHandler.upgrades = null
	InventoryHandler.upgrades  = {"Tentaclular Brachium" = 0, "Haptic Perception" = 0, Pulmonatization = 0, Radula = 0, Arachnopod = 0, Aposematism = 0}
	InventoryHandler.playerCurHealth = 25
	InventoryHandler.playerMaxHealth = 25
	LevelHandler.curLevel =1 
	LevelHandler.curLoop = 0
	LevelHandler.enemyQuant = 10
	LevelHandler.boss6 = true
	#print(InventoryHandler.upgrades)

func _physics_process(delta):
	time += delta *2
	$PointLight2D.texture_scale += (get_sine())/10
	
	
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")

func get_sine():
	return sin(time*1) *1

func _on_options_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	


func _on_timer_timeout():
	$PointLight2D2.visible = true
	$PointLight2D.visible = true
	$AudioStreamPlayer2.play()
