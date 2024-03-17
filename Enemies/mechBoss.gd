extends "res://AcerolaAberationDungeonMartian/Enemies/Base/baseEnemy.gd"


@onready var missile = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/enemyMissile.tscn")
@onready var explode = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/explosion.tscn")

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
		if InventoryHandler.upgrades.get("Omniscience" ) ==1:
			#bul.speed = .1
			bul.speed = shotSpeed * .75
		else: 
			bul.speed = shotSpeed 
		
		shootTimer.start(reloadTimer)
		if !sprite.get_animation() == "attack":
			sprite.set_animation("attack") 
			


func checkHP():
	if health <0:
		if !dying:
			dying = true
			if !sprite.get_animation() == "dying":
				sprite.set_animation("dying") 
			for child in $ExplodeContainer.get_children():
				var explo = explode.instantiate()
				explo.global_position = child.global_position
				await get_tree().create_timer(.1).timeout
				get_parent().add_child(explo)
			await get_tree().create_timer(.5).timeout
			var i = randi_range(0, 4)
			if i == 1:
				get_parent().spawnLoot(global_position)
			queue_free()


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

	
