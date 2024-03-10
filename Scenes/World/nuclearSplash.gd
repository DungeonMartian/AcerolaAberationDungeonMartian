extends AnimatedSprite2D




func _on_timer_timeout():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_end_timer_timeout():
	get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")

