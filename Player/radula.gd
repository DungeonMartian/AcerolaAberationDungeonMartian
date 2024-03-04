extends Area2D

var damage : float
var poisonDamage : float

var canFire: bool = true
var fired : bool = false
var direction
var goHere 
var speed : float = 10
@onready var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/World/Player")
	set_as_top_level(true)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if fired:
		position = position.move_toward(goHere, speed)
		#Vector2.move_toward( goHere, delta)  
	if !fired:
		global_position = get_parent().global_position
		look_at(player.mousePos)

	
	
func fire():
	if canFire:
		
		goHere = player.mousePos
		#goHere =  get_global_mouse_position ()
		#
		fired = true
		canFire = false
		#player.toothRotate = false
		#
		await get_tree().create_timer(0.7).timeout
		fired = false
	
		await get_tree().create_timer(.2).timeout
		canFire = true
		#player.toothRotate = true
		#set_as_top_level(false)

		

func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.enemyHit(damage)
		body.enemyPoison(poisonDamage)

