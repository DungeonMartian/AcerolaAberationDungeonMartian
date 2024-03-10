extends CharacterBody2D

#stats
var time : float
var speed: float = 15.0 
var maxSpeed: float = 150 
var modSpeed : float
var modMaxSpeed : float
var armour :float = 0
var damage : float = 10
var poisonDamage : float = 0
var deflectPercent : float = 0
var swingRate : float = 1

#states
var dying : bool = false
var screenShake : bool = false
var spinning : bool = false
var decayMod : float = 7
var mousePos :Vector2
var attacking : bool = false
var canAttack : bool = true
var canDeflect : bool = false
var canHurt : bool = false


#preloads
@onready var camera = $Camera2D
@onready var horn = $bewbewbwewbew
@onready var light = $PointLight2D
@onready var sprite = $Sprite2D
@onready var radulaPivot = $radulaPivot
@onready var toothPoint = $radulaPivot/ToothPoint
@onready var toothPoint2 = $radulaPivot/ToothPoint2
@onready var defBullet = preload("res://AcerolaAberationDungeonMartian/Player/deflectBullet.tscn")
@onready var regAttack = preload("res://AcerolaAberationDungeonMartian/Player/MeleeAttack.tscn")
@onready var smallAttack = preload("res://AcerolaAberationDungeonMartian/Player/playerAttackSmall.tscn")
@onready var attackTimer = $attackTimer
@onready var healthBar = $Camera2D/ProgressBar

#upgrade unlocks
var frogLegs : bool = false
var poisonTrail : bool = false
var contactPoison : bool = false
var neuroToxic : bool = false
var hasTent : bool = false
var hasLongTent : bool = false

var hasRadula : bool = false
var hasExtra : bool = false
@onready var slimeTime = $slimeTimer
@onready var slimeTrail = preload("res://AcerolaAberationDungeonMartian/Player/playerSlime.tscn")
@onready var radula = preload("res://AcerolaAberationDungeonMartian/Player/radula.tscn")


var upgradesHas = InventoryHandler.upgrades


func _ready():
	if LevelHandler.curLevel ==7 || LevelHandler.curLoop >=1:
		var grey = Color (0.3, 0.3, 0.3, 1)
		light.set_color(grey)
	randomize()
	getUpgrades()
	modSpeed = speed
	modMaxSpeed = maxSpeed 
	if poisonTrail:
		slimeTime.start()
	if hasRadula:
		var tooth = radula.instantiate()
		toothPoint.add_child(tooth)
		tooth.damage = damage
		if neuroToxic:
			tooth.poisonDamage = poisonDamage
		if hasExtra:
			var tooth2 = radula.instantiate()
			tooth2.damage = damage
			tooth2.poisonDamage = poisonDamage
			toothPoint2.add_child(tooth2)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity += input_direction * modSpeed
	
	#mousePos = get_viewport().get_mouse_position()*3
	mousePos = get_global_mouse_position()
	
	if Input.is_action_just_pressed("attack"):
		if canAttack:
			var i = randi_range(0,2)
			match i:
				0:
					$Swing1.play()
				1:
					$Swing2.play()
				2:
					$Swing3.play()
				_: pass
			var at = regAttack.instantiate()
			#var at = smallAttack.instantiate()
			at.damage = damage
			Shake(.1)
			add_child(at)
			if hasTent:
				at.set_scale(Vector2( 1.2,  1.2))
			if hasLongTent:
				at.set_scale(Vector2( 1.5,  1.5))
			at.look_at(mousePos)
			attackTimer.start(swingRate)
			canAttack = false
			
	if Input.is_action_pressed("reload"):
		get_parent().get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")
	if Input.is_action_just_pressed("airHorne"):
		horn.play()
		Shake(.1)
	if Input.is_action_pressed("toothFire"):
		for i in radulaPivot.get_children():
			for g in i.get_children():
				if g.has_method("fire"):
					g.fire()
		

func _physics_process(delta):
	if !attacking:
		if velocity.x < 0:
			if !sprite.flip_h == true:
				sprite.flip_h = true
				for child in $Sprite2D/Node2D.get_children():
					child.flip_h = true
		elif velocity.x > 0:
			if !sprite.flip_h == false:
				sprite.flip_h = false
				for child in $Sprite2D/Node2D.get_children():
					child.flip_h = false
				
	time += delta*7
	if !dying:
		if contactPoison:
			for i in get_slide_collision_count():
				var collision = get_slide_collision(i)
				if collision.get_collider() != null:
					if collision.get_collider().is_in_group("enemy") :
						collision.get_collider().enemyPoison(poisonDamage)
					else: pass
				
		get_input()
		if screenShake:
			camera.offset.x = randf_range(-5,5)
			camera.offset.y = randf_range(-5,5)
		if spinning:
			sprite.rotation += rad_to_deg(0.004)
			canHurt = false
	
	if frogLegs:
		modSpeed = speed *(get_sine()+1)
		modMaxSpeed = maxSpeed *(get_sine()+1)

	camera.global_position = lerp(global_position, mousePos, delta*15)

	#look_at(mousePos)
	
			
	velocity.y = clamp(velocity.y, -modMaxSpeed, modMaxSpeed)
	velocity.x = clamp(velocity.x, -modMaxSpeed, modMaxSpeed)
	velocity = lerp(velocity, Vector2(0,0), delta*decayMod)
	velocity.normalized()
	move_and_slide()

func spin():
	Shake(2)
	spinning = true
	speed = 0
	maxSpeed = 0
	modSpeed = 0
	modMaxSpeed = 0
	

func Shake(value):
	if ! dying:
		screenShake = true
		await get_tree().create_timer(value).timeout
		screenShake = false
		camera.offset.x = 0
		camera.offset.y = 0

func getUpgrades():
	#Tentacles = 0, Haptic = 0,  = 0, Radula = 0, Arachnopod = 0, Aposematism = 0
	healthBar.max_value = InventoryHandler.playerMaxHealth
	healthBar.value = InventoryHandler.playerCurHealth
	updateHP()
	if upgradesHas.get("Tentaclular Brachium" ) ==1 :
		$Sprite2D/Node2D/Tentacles.visible = true
		hasTent  = true
	if upgradesHas.get("Sharp Tentacles" ) ==1 :
		damage += 5
	if upgradesHas.get("Long Tentacles" ) ==1 :
		hasLongTent = true
		
	if upgradesHas.get("Haptic Perception" ) ==1 :
		$Sprite2D/Node2D/Haptic.visible = true
		light.scale = Vector2(0.7,0.7)  
		canDeflect = true
		deflectPercent += 30
	if upgradesHas.get("Occular Degeneration" ) ==1 :
		light.scale = Vector2(0.4,0.4)  
		canDeflect = true
		deflectPercent += 30
	if upgradesHas.get("Omniscience" ) ==1 :
		#done 
		pass
		
	if upgradesHas.get("Pulmonatization" ) ==1 :
		set_scale(Vector2(1.2,1.2))
		armour += 1
		speed -= 5
		maxSpeed -= 15
		$Sprite2D/Node2D/Pulmonatization.visible = true
	if upgradesHas.get("Mucopolysaccharide" ) ==1 :
		poisonTrail = true
		poisonDamage +=5
	if upgradesHas.get("ExoSkeleton" ) ==1 :
		set_scale(Vector2(1.2,1.2))
		armour += 1
		speed -= 5
		maxSpeed -= 15
		
	if upgradesHas.get("Radula" ) ==1 :
		hasRadula = true
	if upgradesHas.get("Neurotoxin Poison" ) ==1 :
		neuroToxic = true
		poisonDamage +=5
	if upgradesHas.get("Extra Tooth" ) ==1 :
		hasExtra = true

	if upgradesHas.get("Arachnopod" ) ==1 :
		speed +=2
		maxSpeed +=5
		$Sprite2D/Node2D/Arachnopod.visible = true
	if upgradesHas.get("All Terrain" ) ==1 :
		speed +=3
		maxSpeed +=10
	if upgradesHas.get("Apex Predator" ) ==1 :
		damage +=5

	if upgradesHas.get("Aposematism" ) ==1 :
		poisonDamage +=5
		set_scale(Vector2(.9,.9))
		$Sprite2D/Node2D/Aposematism.visible = true
		contactPoison = true
	if upgradesHas.get("Bufonidaemorphism" ) ==1 :
		speed +=10
		maxSpeed +=30
		frogLegs = true
	if upgradesHas.get("Toxic" ) ==1 :
		poisonDamage += 5

	

func playerHit(dmg, isBullet):
	var tempDMG = dmg - armour
	
	if deflectPercent > 0:
		if isBullet == true:
			var defRoll = randi_range(0,99)
			if defRoll< deflectPercent:
				var defB = defBullet.instantiate()
				defB.global_position = global_position
				call_deferred("add_child", defB)
				defB.look_at(Vector2i(randi_range(-3000,3000),randi_range(-3000,3000)))
			else:
				if canHurt: 
					InventoryHandler.playerCurHealth -= tempDMG
					canHurt = false
					$hurtTimer.start(.1)
		else: 
			if canHurt: 
				InventoryHandler.playerCurHealth -= tempDMG
				canHurt = false
				$hurtTimer.start(.1)
	else: 
		if canHurt: 
			InventoryHandler.playerCurHealth -= tempDMG
			canHurt = false
			$hurtTimer.start(.1)
		
	
	
	updateHP()

func updateHP():
	if InventoryHandler.playerCurHealth > InventoryHandler.playerMaxHealth:
		InventoryHandler.playerCurHealth = InventoryHandler.playerMaxHealth
	healthBar.value = InventoryHandler.playerCurHealth
	#print(InventoryHandler.playerCurHealth)
	if InventoryHandler.playerCurHealth <=0 :
		get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/MainMenu/mainMenu.tscn")

		
		
func get_sine():
	return sin(time*1) *1


func pickup(type, amount):
	match type:
		"health":
			InventoryHandler.playerCurHealth += amount
			updateHP()
		_:
			print("uh oh")
	
	
	pass


func _on_slime_timer_timeout():
	var s = slimeTrail.instantiate()
	get_parent().add_child(s)
	s.global_position = global_position
	s.poisonDamage = poisonDamage


func _on_attack_timer_timeout():
	canAttack = true


func _on_hurt_timer_timeout():
	canHurt = true
