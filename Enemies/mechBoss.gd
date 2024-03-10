extends "res://AcerolaAberationDungeonMartian/Enemies/Base/baseEnemy.gd"


@onready var missile = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/enemyMissile.tscn")


func tryFire():
	if canShoot:
		
		canShoot = false
		looped = false
		var bul = bullet.instantiate()
		bul.shoot = true
		bul.damage = damage
		bul.global_position = global_position
		get_parent().add_child(bul)
		bul.look_at(player.global_position)
		bul.speed = shotSpeed
		shootTimer.start(reloadTimer)
		if !sprite.get_animation() == "attack":
			sprite.set_animation("attack") 
			





func _on_missile_timer_timeout():
	#print("im here")
	if player != null:
		#print("player")
		#for i in 3:
		for i in $missileContainer.get_children():
			
			var m = missile.instantiate()
			get_parent().add_child(m)
			m.global_position = i.global_position
			m.location = player.global_position+ Vector2(randf_range(-20,20),randf_range(-20,20))

	
