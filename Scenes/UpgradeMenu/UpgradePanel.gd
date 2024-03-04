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
			helperLabel.set_text("Increased movement")
		_:
			helperLabel.set_text("You fucked up")


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
