extends Node


var curLevel : int = 6
var enemyQuant : int = 10
var curLoop : int = 0
var boss6 : bool = true

@onready var passiveEnemy = preload("res://AcerolaAberationDungeonMartian/Enemies/Scientist.tscn")
@onready var securityBot = preload("res://AcerolaAberationDungeonMartian/Enemies/LaserRobot.tscn")
@onready var armyGuy = preload("res://AcerolaAberationDungeonMartian/Enemies/armyMan.tscn")
@onready var mechboss = preload("res://AcerolaAberationDungeonMartian/Enemies/mechBoss.tscn")

func nextLevel():
	curLevel += 1
	enemyQuant +=1
	if curLevel ==8:
		curLevel = 1
		curLoop +=1
		boss6  = true
	


func get_enemy():
	var toReturn
	match curLevel:
		1:
			var i = randi_range(0,2)
			if i == 0:
				toReturn = securityBot
			else:
				toReturn = passiveEnemy
		2:
			var i = randi_range(0,3)
			if i == 0:
				toReturn = passiveEnemy
			else:
				toReturn = securityBot
		3:
			var i = randi_range(0,1)
			if i == 0:
				toReturn = armyGuy
			else:
				toReturn = securityBot
			#add boss fight
		4:
			var i = randi_range(0,1)
			if i == 0:
				toReturn = armyGuy
			else:
				toReturn = securityBot
			#wildlife
		5:
			var i = randi_range(0,1)
			if i == 0:
				toReturn = armyGuy
			else:
				toReturn = securityBot
			#wildlife
		6:
			var i = randi_range(0,1)
			if boss6 == true:
				boss6 = false
				toReturn = mechboss
			else:
				if i == 0:
					toReturn = armyGuy
				else:
					toReturn = securityBot
			
			
			#wildlife
			#add boss fight
		7:
			var i = randi_range(0,1)
			if i == 0:
				toReturn = armyGuy
			else:
				toReturn = securityBot
		_:
			print("fuck")
			toReturn = passiveEnemy
			
			
	

	#print(toReturn)
	return toReturn.instantiate()
	 
	
