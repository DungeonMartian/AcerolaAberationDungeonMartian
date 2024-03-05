extends CharacterBody2D


var direction : Vector2
var player 
var isInRange : bool = false
var dying : bool = false
var canShoot : bool = true

var poisonQuant : float = 0

@export var damage : float
@export var health : float
@export var passive : bool
@export var speed : float
@export var maxSpeed : float
@export var reloadTimer : float
@onready var canShootArea = $canShootArea
@onready var poisonTimer = $poisonTimer
@onready var bullet = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/enemyBullet.tscn")
@onready var shootTimer = $reloadTimer
@export var sprite : Sprite2D

func _physics_process(_delta):
	if ! dying:
		if player != null:
			direction = global_position.direction_to(player.global_position)
			
			if passive:
				runAway()
			if !passive:
				moveTowards()
	if velocity.x < 0:
		if !sprite.is_flipped_h():
			sprite.set_flip_h(true)
	elif velocity.x > 0 :
		if sprite.is_flipped_h():
			sprite.set_flip_h(false)
	velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
	velocity.y = clamp(velocity.y, -maxSpeed, maxSpeed)
	move_and_slide()

func moveTowards():
	if canShootArea.overlaps_body(player):
		tryFire()
		velocity = Vector2(0,0)
	else:
		velocity += direction * speed
	
func runAway():
	velocity +=  randf_range(-1.5,-.5) * direction * speed
	
func tryFire():
	if canShoot:
		canShoot = false
		var bul = bullet.instantiate()
		bul.shoot = true
		bul.damage = damage
		bul.global_position = global_position
		get_parent().add_child(bul)
		bul.look_at(player.global_position)
		shootTimer.start(reloadTimer)
	
func _on_player_detector_body_entered(body):
	if body.is_in_group("player"):
		player = body
		
func checkHP():
	print(health)
	if health <0:
		if !dying:
			dying = true
			await get_tree().create_timer(1.0).timeout
			queue_free()


func enemyPoison(poisonDamage):
	poisonQuant += poisonDamage
	poisonTimer.start(1)
	sprite.modulate.g = 255
	sprite.modulate.r = 0
	sprite.modulate.b = 0

	
func enemyHit(dmg, dir):
	print("hit")
	health -= dmg
	velocity += dir *( dmg * 500)
	checkHP()


func _on_poison_timer_timeout():
	poisonQuant -=1
	checkHP()
	if poisonQuant <0:
		poisonTimer.start(1)
	else:
		sprite.modulate.g = 255
		sprite.modulate.r = 255
		sprite.modulate.b = 255


func _on_reload_timer_timeout():
	canShoot = true
