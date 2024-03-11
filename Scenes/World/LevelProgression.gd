extends Area2D


func _process(_delta):
	
	if InventoryHandler.curKeys >=3:
		if $AnimatedSprite2D.get_animation() != "open":
			$AnimatedSprite2D.set_animation("open")
	


func _on_body_entered(body):
	if InventoryHandler.curKeys >= 3:
		if body.is_in_group("player"):
			body.spin()
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/UpgradeMenu/upgradeMenu.tscn")
