extends Node2D

var findPlayer : bool = false

@onready var hpPick = preload("res://AcerolaAberationDungeonMartian/Pickups/healthPickup.tscn")


@onready var bossMech = preload("res://AcerolaAberationDungeonMartian/Enemies/mechBoss.tscn")
#second boss

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasModulate.visible = true
	if !InventoryHandler.isMuted:
		match LevelHandler.curLoop:
			0:
				match LevelHandler.curLevel:
					2:
						$MusicContainer/Stage2.play()
					3:
						$MusicContainer/BossAudio.play()
					4:
						$MusicContainer/Stage4.play()
					5:
						$MusicContainer/Stage5.play()
					6:
						$MusicContainer/BossAudio2.play()
					7:
						$MusicContainer/Wasteland.play()
					8:
						$MusicContainer/Stage8.play()
					_:
						$MusicContainer/Stage1.play()
			_:
				$MusicContainer/Wasteland.play()
	if LevelHandler.curLevel ==3 || LevelHandler.curLevel ==6:
		var en = bossMech.instantiate()
		add_child.call_deferred(en)
		en.position = $TileMap.map_to_local(Vector2i(0,0))

func spawnLoot(loc):
	#this might roll if I can think of some
	var pick = hpPick.instantiate()
	pick.global_position = loc
	add_child(pick)
	

func _physics_process(_delta):
	if findPlayer == true:
		var player = get_tree().get_nodes_in_group("player")[0]
		get_tree().call_group("enemy", "findPlayer", player.global_position)
		



func _on_timer_timeout():
	findPlayer = true
