extends Node


var curLevel : int = 1
var enemyQuant : int = 10

@onready var passiveEnemy = preload("res://AcerolaAberationDungeonMartian/Enemies/Scientist.tscn")
@onready var securityBot = preload("res://AcerolaAberationDungeonMartian/Enemies/LaserRobot.tscn")
var armyGuy


func nextLevel():
	curLevel += 1
	enemyQuant +=1
	


func get_enemy():
	var toReturn
	var i = randi_range(0,3)
	if i == 0:
		toReturn = passiveEnemy

	elif i == 1:
		#toReturn = passiveEnemy
		toReturn = securityBot

	elif i == 2:
		toReturn = passiveEnemy
	else:
		toReturn = passiveEnemy
	print(toReturn)
	return toReturn.instantiate()
	 
	
