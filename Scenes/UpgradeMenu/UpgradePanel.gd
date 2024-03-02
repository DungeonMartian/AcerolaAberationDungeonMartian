extends Sprite2D

@onready var label = $Label
var upgradeToGo

func setUpgrade(upgradeToSet):
	upgradeToGo = upgradeToSet
	label.set_text(str(upgradeToSet))



# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	InventoryHandler.upgrades[upgradeToGo] = 1
	#progress scene
