extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	match LevelHandler.curLevel:
		1:
			$MusicContainer/Stage1.play()
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
			pass
		8:
			$MusicContainer/AudioStreamPlayer7.play()
		
		



