extends Area2D

var poisonDamage : float




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.modulate.a -=.01
	if modulate.a <=0 :
		queue_free()
	




func _on_timer_timeout():
	for body in get_overlapping_bodies():
		if body.is_in_group("enemy"):
			body.enemyPoison(poisonDamage)
