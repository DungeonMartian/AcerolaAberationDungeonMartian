extends CharacterBody2D


var speed = 15.0
var maxSpeed = 150

var dying : bool = false
var screenShake : bool = false

var mousePos :Vector2
@onready var camera = $Camera2D
@onready var horn = $bewbewbwewbew

func _ready():
	randomize()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity += input_direction * speed
	mousePos = get_viewport().get_mouse_position()*3
	
	if Input.is_action_pressed("reload"):
		get_parent().get_tree().change_scene_to_file("res://AcerolaAberationDungeonMartian/Scenes/World/World.tscn")
	if Input.is_action_just_pressed("airHorne"):
		horn.play()
		Shake(.1)

func _physics_process(delta):
	if !dying:
		get_input()
		if screenShake:
			camera.offset.x = randf_range(-5,5)
			camera.offset.y = randf_range(-5,5)

			
			
	camera.global_position = lerp(global_position, mousePos, delta*3)

	
			
	velocity.y = clamp(velocity.y, -maxSpeed, maxSpeed)
	velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
	velocity = lerp(velocity, Vector2(0,0), delta*7)
	move_and_slide()



func Shake(value):
	if ! dying:
		screenShake = true
		await get_tree().create_timer(value).timeout
		screenShake = false
		camera.offset.x = 0
		camera.offset.y = 0
