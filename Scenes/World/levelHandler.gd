extends Node


var curLevel : int = 1
var enemyQuant : int = 10
var curLoop : int = 0

@onready var passiveEnemy = preload("res://AcerolaAberationDungeonMartian/Enemies/Scientist.tscn")
@onready var securityBot = preload("res://AcerolaAberationDungeonMartian/Enemies/LaserRobot.tscn")
@onready var armyGuy = preload("res://AcerolaAberationDungeonMartian/Enemies/armyMan.tscn")


func nextLevel():
	curLevel += 1
	enemyQuant +=1
	if curLevel ==8:
		curLevel = 1
		curLoop +=1
	


func get_enemy():
	var toReturn
	var i = randi_range(0,3)
	if i == 0:
		toReturn = passiveEnemy

	elif i == 1:
		#toReturn = passiveEnemy
		toReturn = securityBot

	elif i == 2:
		toReturn = armyGuy
	else:
		toReturn = passiveEnemy
	#print(toReturn)
	return toReturn.instantiate()
	 
	
