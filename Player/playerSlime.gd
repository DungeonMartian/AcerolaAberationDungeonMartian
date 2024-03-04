extends Area2D

var poisonDamage : float



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.modulate.a -=.01
	if modulate.a <=0 :
		queue_free()
	for body in get_overlapping_bodies():
		if body.is_in_group("enemy"):
			body.enemyPoison(poisonDamage)


