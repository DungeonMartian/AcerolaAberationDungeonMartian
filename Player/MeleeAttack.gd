extends Area2D

var damage : float



func _on_body_entered(body):
	if body.is_in_group("enemy"):
		var dir = global_position.direction_to(body.global_position)
		body.enemyHit(damage, dir)
	elif body.is_in_group("Missile"):
		body.hit(damage)



func _on_timer_timeout():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group("enemyBullet"):
		area.queue_free()
	
