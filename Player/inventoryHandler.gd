extends Node

var upgrades = {"Tentaclular Brachium" = 0, "Haptic Perception" = 0, Pulmonatization = 0, Radula = 0, Arachnopod = 0, Aposematism = 0}
var playerMaxHealth : float = 25
var playerCurHealth : float = 25
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
func improve():
	if upgrades.get("Tentaclular Brachium" ) ==1 :
		if upgrades.get("Long Tentacles" ) !=1 && upgrades.get("Sharp Tentacles" ) !=1 :
			upgrades["Long Tentacles"] = 0
			upgrades["Sharp Tentacles"] = 0
		pass
	if upgrades.get("Haptic Perception" ) ==1 :
		if upgrades.get("Omniscience" ) !=1 && upgrades.get("Occular Degeneration" ) !=1 :
			upgrades["Omniscience"] = 0
			upgrades["Occular Degeneration"] = 0
		pass
	if upgrades.get("Pulmonatization" ) ==1 :
		if upgrades.get("ExoSkeleton" ) !=1 && upgrades.get("Mucopolysaccharide" ) !=1 :
			upgrades["ExoSkeleton"] = 0
			upgrades["Mucopolysaccharide"] = 0
		pass
	if upgrades.get("Radula" ) ==1 :
		if upgrades.get("Extra Tooth" ) !=1 && upgrades.get("Neurotoxin Poison" ) !=1 :
			upgrades["Extra Tooth"] = 0
			upgrades["Neurotoxin Poison"] = 0
		pass
	if upgrades.get("Arachnopod" ) ==1 :
		if upgrades.get("Apex Predator" ) !=1 && upgrades.get("All Terrain" ) !=1 :
			upgrades["Apex Predator"] = 0
			upgrades["All Terrain"] = 0
		pass
	if upgrades.get("Aposematism" ) ==1 :
		if upgrades.get("Toxic" ) !=1 && upgrades.get("Bufonidaemorphism" ) !=1 :
			upgrades["Toxic"] = 0
			upgrades["Bufonidaemorphism"] = 0
		pass
	print(upgrades)
	pass


func switchWeapon():
	pass
	
