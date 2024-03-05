extends Node


var curLevel : int = 1
var enemyQuant : int = 2

@onready var passiveEnemy = preload("res://AcerolaAberationDungeonMartian/Enemies/testEnemy.tscn")


func get_enemy():
	
	return passiveEnemy
	
