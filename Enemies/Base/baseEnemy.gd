extends CharacterBody2D

var speed : float = 200 
var direction : Vector2
var player 
var isInRange : bool = false
var dying : bool = false

@export var damage : float
@export var health : float
@export var passive : bool
@export var reloadTimer : float
@onready var canShootArea = $canShootArea
@onready var bullet = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/enemyBullet.tscn")
@onready var shootTimer = $reloadTimer
@export var sprite : Sprite2D

func _physics_process(delta):
	if ! dying:
		if player != null:
			direction = global_position.direction_to(player.global_position)
			
			if passive:
				runAway()
			if !passive:
				moveTowards()
	if velocity.x < 0:
		if !sprite.get_flip_h(true):
			sprite.set_flip_h(true)
	elif velocity.x > 0 :
		if sprite.get_flip_h(true):
			sprite.set_flip_h(false)
	move_and_slide()

func moveTowards():
	if canShootArea.overlaps_body(player):
		tryFire()
	else:
		velocity += direction * speed
	
func runAway():
	velocity +=  randf_range(-1.5,-.5) * direction * speed
	
func tryFire():
	var bul = bullet.instantiate()
	get_parent().add_child(bul)
	bul.look_at(player)
	shootTimer.start(reloadTimer)
	
func _on_player_detector_body_entered(body):
	if body.is_in_group("player"):
		player = body
		
func checkHP():
	if health <0:
		dying = true
		pass
