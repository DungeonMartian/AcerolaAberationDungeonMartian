extends CharacterBody2D


var direction : Vector2
var player 
var isInRange : bool = false
var dying : bool = false
var canShoot : bool = true
var looped : bool
var canhurt: bool = true

var poisonQuant : float = 0

@export var walks : bool = true
@export var canMove : bool = true
@export var damage : float
@export var health : float
@export var passive : bool
@export var isRanged : bool
@export var speed : float
@export var maxSpeed : float
@export var reloadTimer : float
@export var shotSpeed : float
@onready var rayCast = $aim/RayCast2D
@onready var raycast2 = $aim/RayCast2D2
@onready var aim = $aim
@onready var canShootArea = $canShootArea
@onready var poisonTimer = $poisonTimer
@onready var bullet = preload("res://AcerolaAberationDungeonMartian/Enemies/Base/enemyBullet.tscn")
@onready var shootTimer = $reloadTimer
@export var sprite : AnimatedSprite2D
@onready var hurtTimer = $hurtTimer
@onready var navAgent = $NavigationAgent2D

func _ready():
	if LevelHandler.curLoop != 0:
		damage+= LevelHandler.curLoop
		health +=(LevelHandler.curLoop *3)


func _physics_process(_delta):
	if !isRanged:
		
		for i in get_slide_collision_count():
			print(i)
			var collision = get_slide_collision(i)
			if collision.get_collider() != null:
				if collision.get_collider().is_in_group("player") :
					collision.get_collider().playerHit(damage, false)
				else: pass
		if !walks:
			velocity = Vector2(0,0)
			move_and_slide()
	if walks:
		if ! dying:
			if player != null:
				direction = to_local(navAgent.get_next_path_position()).normalized()
				#direction = global_position.direction_to(player.global_position)
				
				if passive:
					runAway()
				if !passive:
					moveTowards()
		elif dying:
			velocity = Vector2(0,0)
		if velocity.x < 0:
			if !sprite.is_flipped_h():
				sprite.set_flip_h(true)
		elif velocity.x > 0 :
			if sprite.is_flipped_h():
				sprite.set_flip_h(false)
		velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
		velocity.y = clamp(velocity.y, -maxSpeed, maxSpeed)
		move_and_slide()

func findPlayer(playerLoc):
	if player != null:
		aim.look_at(playerLoc)
		navAgent.target_position = playerLoc
	pass


func moveTowards():
	if canShootArea.overlaps_body(player):
		#print(rayCast.get_collider())
		if rayCast.get_collider() == player && raycast2.get_collider() == player:
			
			tryFire()
			velocity = Vector2(0,0)
		else:
			velocity += direction * speed
	else:
		velocity += direction * speed
	
func runAway():
	velocity +=  randf_range(-1.5,-.5) * direction * speed
	
func tryFire():
	if canShoot:
		
		canShoot = false
		looped = false
		var bul = bullet.instantiate()
		bul.shoot = true
		bul.damage = damage
		bul.global_position = global_position
		get_parent().add_child(bul)
		bul.look_at(player.global_position)
		bul.speed = shotSpeed
		shootTimer.start(reloadTimer)
		if !sprite.get_animation() == "attack":
			sprite.set_animation("attack") 
	
func _on_player_detector_body_entered(body):
	if body.is_in_group("player"):
		player = body
		
func checkHP():

	if health <0:
		if !dying:
			dying = true
			await get_tree().create_timer(.5).timeout
			var i = randi_range(0, 4)
			if i == 1:
				get_parent().spawnLoot(global_position)
			queue_free()


func enemyPoison(poisonDamage):
	poisonQuant += poisonDamage
	poisonTimer.start(1)
	sprite.modulate.g = 1
	sprite.modulate.r = 0
	sprite.modulate.b = 0

	
func enemyHit(dmg, dir):
	if canhurt:
		health -= dmg
		if canMove:
			velocity = dir *( dmg *100)
		canhurt = false
		hurtTimer.start()
		move_and_slide()
		checkHP()


func _on_poison_timer_timeout():
	poisonQuant -=5
	health -= 1
	
	checkHP()
	if poisonQuant >0:
		if poisonTimer.is_stopped ( ):
			poisonTimer.start(1)
	if poisonQuant <=0:
		sprite.modulate.g =1
		sprite.modulate.r = 1
		sprite.modulate.b =1


func _on_reload_timer_timeout():
	canShoot = true


func _on_player_detector_body_exited(body):
	if body.is_in_group("player"):
		player = null
		if sprite.get_animation() == "attack":
			sprite.set_animation("default") 


func _on_hurt_timer_timeout():
	canhurt = true
