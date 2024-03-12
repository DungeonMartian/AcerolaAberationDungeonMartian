extends Node2D

var time : float

func _ready():
	InventoryHandler.upgrades = null
	InventoryHandler.loopUpgrades = {}
	InventoryHandler.upgrades  = {"Tentaclular Brachium" = 0, "Haptic Perception" = 0, Pulmonatization = 0, Radula = 0, Arachnopod = 0, Aposematism = 0}
	InventoryHandler.playerCurHealth = 25
	InventoryHandler.playerMaxHealth = 25
	InventoryHandler.curKeys = 0
	LevelHandler.curLevel =1 
	LevelHandler.curLoop = 0
	LevelHandler.enemyQuant = 10
	#print(InventoryHandler.upgrades)

func _physics_process(delta):
	time += delta *2
	$PointLight2D.texture_scale += (get_sine())/10
	
	
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")

func get_sine():
	return sin(time*1) *1

func _on_options_button_pressed():
	$Panel.visible = !$Panel.visible
	$cameraPan.visible = !$cameraPan.visible
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	


func _on_timer_timeout():
	$PointLight2D2.visible = true
	$PointLight2D.visible = true
	$AudioStreamPlayer2.play()


func _on_check_button_pressed():
	InventoryHandler.isMuted = $Panel/CheckButton.button_pressed



func _on_camera_button_pressed():
	InventoryHandler.dontTrack = $cameraPan/cameraButton.button_pressed
