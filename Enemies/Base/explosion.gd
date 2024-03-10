extends Area2D

var damage : float = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	print("explodring")
	for body in get_overlapping_bodies():
		if body.has_method("playerHit"):
			body.playerHit(damage, false)
		elif body.has_method("enemyHit"):
			var dir = global_position.direction_to(body.global_position)
			body.enemyHit(damage, dir)





func _on_timer_timeout():
	
	queue_free()
	pass # Replace with function body.
