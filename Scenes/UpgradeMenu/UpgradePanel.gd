extends Sprite2D

@onready var label = $Label
@onready var helper = $Panel
var upgradeToGo


func setUpgrade(upgradeToSet):
	upgradeToGo = upgradeToSet
	label.set_text(str(upgradeToSet))



# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.



func _on_button_pressed():
	InventoryHandler.upgrades[upgradeToGo] = 1
	get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")
	InventoryHandler.improve()
	#progress scene


func _on_button_mouse_entered():
	helper.visible = true


func _on_button_mouse_exited():
	helper.visible = false
