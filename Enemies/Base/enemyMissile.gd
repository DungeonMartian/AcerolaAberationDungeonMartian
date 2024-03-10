extends CharacterBody2D

var shoot:bool = false
var damage:int = 1
var speed :float =20
var maxSpeedX : float = 80
var maxSpeedY : float = 80
var hp : float = 20

var location
var direction

@onready var explosion = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/explosion.tscn")

func _ready():
	if InventoryHandler.upgrades.get("Omniscience" ) ==1:
		speed *= .75
		maxSpeedX *= .75
		maxSpeedY *= .75
	set_as_top_level(true)

func _physics_process(delta):
	direction = global_position.direction_to(location)
	look_at(global_position -velocity)
	velocity += direction * speed * delta
	velocity.x = clamp(velocity.x, -maxSpeedX, maxSpeedX)
	velocity.y = clamp(velocity.y, -maxSpeedY, maxSpeedY)
	velocity.normalized()
	if global_position == location:
		explode()
	move_and_slide()


func hit(dmg):
	print("hit")
	hp -= dmg
	velocity *= -1
	if hp <= 0:
		await get_tree().create_timer(.5).timeout
		explode()


func _on_area_2d_body_entered(body):
	if body.is_in_group ("player"):
		body.playerHit(damage, true)
		explode()
	elif body.is_in_group("enemy"):
		pass
	else:

		explode()

func explode():
	var b = explosion.instantiate()
	b.global_transform = global_transform
	get_parent().get_parent().call_deferred("add_child", b)

	
	queue_free()



func _on_timer_timeout():
	explode()

