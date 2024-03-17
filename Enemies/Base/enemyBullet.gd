extends Area2D

var shoot:bool = false
var damage:int = 1
var speed :float =300



func _ready():
	
		
	set_as_top_level(true)

func _physics_process(delta):
	if shoot:
		position += transform.x * speed *delta




func _on_area_2d_body_entered(body):
	if body.is_in_group ("player"):
		body.playerHit(damage, true)
		self.queue_free()
	elif body.is_in_group("enemy"):
		pass
	else:

		self.queue_free()

