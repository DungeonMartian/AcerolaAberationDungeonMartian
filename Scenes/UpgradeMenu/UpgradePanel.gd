extends Sprite2D

@onready var label = $Panel2/Label
@onready var helper = $Panel
@onready var helperLabel = $Panel/Helper
var upgradeToGo


func setUpgrade(upgradeToSet):
	upgradeToGo = upgradeToSet
	label.set_text(str(upgradeToSet))
	match upgradeToSet:
		"Tentaclular Brachium":
			helperLabel.set_text("Longer melee range")
		"Long Tentacles":
			helperLabel.set_text("Even longer melee range")
		"Sharp Tentacles":
			helperLabel.set_text("Melee damage up")
		"Haptic Perception":
			helperLabel.set_text("Reduced vision, deflect some projectiles")
		"Omniscience":
			helperLabel.set_text("Projectiles move slower")
		"Occular Degeneration":
			helperLabel.set_text("Further reduce vision, deflect more projectiles")
		"Pulmonatization":
			helperLabel.set_text("Higher defense, slower movement")
		"ExoSkeleton":
			helperLabel.set_text("Greater defense, even slower movement")
		"Mucopolysaccharide":
			helperLabel.set_text("Leave a toxic trail, poison damage up")
		"Radula":
			helperLabel.set_text("Right click to fire a razor tooth")
		"Extra Tooth":
			helperLabel.set_text("Gain a second tooth")
		"Neurotoxin Poison":
			helperLabel.set_text("Tooth applies poison damage, poison damage up")
		"Arachnopod":
			helperLabel.set_text("Faster movement")
		"Apex Predator":
			helperLabel.set_text("Greater melee damage")
		"All Terrain":
			helperLabel.set_text("Even faster movement, ignore difficult terrain")
		"Aposematism":
			helperLabel.set_text("Contact applies poison damage, poison damage up")
		"Toxic":
			helperLabel.set_text("Poison damage up")
		"Bufonidaemorphism":
			helperLabel.set_text("Increased movement, frog legs")
		_:
			helperLabel.set_text("Redacted.")


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.



func _on_button_pressed():
	match upgradeToGo:
		"Tentaclular Brachium":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Long Tentacles":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Sharp Tentacles":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Haptic Perception":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Omniscience":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Occular Degeneration":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Pulmonatization":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"ExoSkeleton":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Mucopolysaccharide":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Radula":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Extra Tooth":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Neurotoxin Poison":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Arachnopod":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Apex Predator":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"All Terrain":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Aposematism":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Toxic":
			InventoryHandler.upgrades[upgradeToGo] = 1
		"Bufonidaemorphism":
			InventoryHandler.upgrades[upgradeToGo] = 1
		_:
			InventoryHandler.loopUpgrades[upgradeToGo] = 1
	
	if LevelHandler.curLevel != 7:
		get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")
	elif LevelHandler.curLevel == 7:
		get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/nuclearSplash.tscn")
	InventoryHandler.improve()
	#progress scene


func _on_button_mouse_entered():
	helper.visible = true


func _on_button_mouse_exited():
	helper.visible = false
