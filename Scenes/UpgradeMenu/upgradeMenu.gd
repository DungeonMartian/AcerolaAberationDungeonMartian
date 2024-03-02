extends Node2D

var possibleUpgrades = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for key in InventoryHandler.upgrades:
		var value =  InventoryHandler.upgrades[key]
		if value == 0:
			possibleUpgrades.append (key)
		
	for g in $PanelHolder.get_children():
		print("hello")
		var randUpgrade =randi_range(0, possibleUpgrades.size()-1)
		g.setUpgrade(possibleUpgrades[randUpgrade]) # possibleUpgrades.pick_random()
		possibleUpgrades.remove_at(randUpgrade)
		
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
