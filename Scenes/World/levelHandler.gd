extends Node


var curLevel : int = 4
var enemyQuant : int = 10
var curLoop : int = 0

@onready var passiveEnemy = preload("res://AcerolaAberationDungeonMartian/Enemies/Scientist.tscn")
@onready var securityBot = preload("res://AcerolaAberationDungeonMartian/Enemies/LaserRobot.tscn")
@onready var armyGuy = preload("res://AcerolaAberationDungeonMartian/Enemies/armyMan.tscn")
@onready var mechboss = preload("res://AcerolaAberationDungeonMartian/Enemies/mechBoss.tscn")
@onready var cactus = preload("res://AcerolaAberationDungeonMartian/Enemies/Cactus.tscn")

func _ready():
	randomize()

func nextLevel():
	curLevel += 1
	enemyQuant +=1
	if curLevel ==8:
		curLevel = 1
		curLoop +=1


func get_enemy():
	var toReturn
	match curLoop:
		0:
			match curLevel:
				1:
					var i = randi_range(0,2)
					if i == 0:
						toReturn = securityBot
					else:
						toReturn = passiveEnemy
				2:
					var i = randi_range(0,2)
					if i == 0:
						toReturn = passiveEnemy
					else:
						toReturn = securityBot
				3:
					var i = randi_range(0,2)
					if i == 0:
						toReturn = armyGuy
					else:
						toReturn = securityBot
					#add boss fight
				4:
					var i = randi_range(0,2)
					if i == 0:
						toReturn = armyGuy
					elif i == 1:
						toReturn = cactus
					else:
						toReturn = securityBot
					#wildlife
				5:
					var i = randi_range(0,5)
					if i == 0:
						toReturn = armyGuy
					elif i == 1:
						toReturn = armyGuy
					elif i == 2:
						toReturn = cactus
					else:
						toReturn = securityBot
					#wildlife
				6:
					var i = randi_range(0,2)
					if i == 0:
						toReturn = armyGuy
					elif i == 1:
						toReturn = cactus
					else:
						toReturn = securityBot
					
					
					#wildlife
					#add boss fight
				7:
					var i = randi_range(0,3)
					if i == 0:
						toReturn = armyGuy
					elif i == 1:
						toReturn = armyGuy
					elif i == 2:
						toReturn = cactus
					else:
						toReturn = securityBot
				_:
					print("fuck")
					toReturn = passiveEnemy
		_:
			var i = randi_range(0,4)
			if i == 0:
				toReturn = securityBot
			elif i == 1:
				toReturn = armyGuy
			elif i == 2:
				toReturn = mechboss
			elif i == 3:
				toReturn = passiveEnemy
			elif i == 4:
				toReturn = cactus
			pass
			
	

	#print(toReturn)
	return toReturn.instantiate()
	 
	
