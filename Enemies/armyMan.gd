extends "res://AcerolaAberationDungeonMartian/Enemies/Base/baseEnemy.gd"


func tryFire():
	if canShoot:
		
		canShoot = false
		looped = false
		for i in 5:
			var bul = bullet.instantiate()
			bul.shoot = true
			bul.damage = damage
			bul.global_position = global_position
			get_parent().add_child(bul)
			if InventoryHandler.upgrades.get("Omniscience" ) ==1:
			#bul.speed = .1
				bul.speed = shotSpeed * .75
			else: 
				bul.speed = shotSpeed 
			bul.look_at(player.global_position + Vector2(randi_range(-20,20),randi_range(-20,20)))
		shootTimer.start(reloadTimer)
		if !sprite.get_animation() == "attack":
			sprite.set_animation("attack") 
	
