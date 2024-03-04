extends Area2D

var shoot:bool = false
var damage:int = 8
var speed :float =300


func _ready():
	set_as_top_level(true)

func _physics_process(delta):
	if shoot:
		position += transform.x * speed *delta


func _on_body_entered(body):
	if body.name == "Player":
		body.playerHit(damage)
		self.queue_free()
	elif body.is_in_group("enemies"):

		pass
	else:

		self.queue_free()
