extends Node2D

@onready var hpPick = preload("res://AcerolaAberationDungeonMartian/Pickups/healthPickup.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
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

func spawnLoot(loc):
	#this might roll if I can think of some
	var pick = hpPick.instantiate()
	pick.global_position = loc
	add_child(pick)
	

