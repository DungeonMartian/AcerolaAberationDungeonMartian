extends Area2D



func _on_body_entered(body):
	if body.is_in_group("player"):
		body.spin()
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/UpgradeMenu/upgradeMenu.tscn")
