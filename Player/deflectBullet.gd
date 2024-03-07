extends Area2D

var shoot:bool = false
var damage:int = 1
var speed :float =200



func _ready():
	if InventoryHandler.upgrades.get("Omniscience" ) ==1:
		speed =100
	set_as_top_level(true)

func _physics_process(delta):
	position += transform.x * speed *delta




func _on_area_2d_body_entered(body):
	if body.is_in_group ("enemy"):
		var dir = global_position.direction_to(body.global_position)
		body.enemyHit(damage,  dir)
		self.queue_free()
	elif body.is_in_group("player"):
		pass
	else:

		self.queue_free()

