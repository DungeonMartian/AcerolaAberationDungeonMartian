extends Node

var upgrades = {Tentacles = 0, Haptic = 0, Pulmonatization = 0, Radula = 0, Arachnopod = 0, Aposematism = 0}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
func improve():
	if upgrades.get("Tentacles" ) ==1 :
		if upgrades.get("LongTentacles" ) !=1 && upgrades.get("SharpTentacles" ) !=1 :
			upgrades["LongTentacles"] = 0
			upgrades["SharpTentacles"] = 0
		pass
	if upgrades.get("Haptic" ) ==1 :
		if upgrades.get("Omniscience" ) !=1 && upgrades.get("OccularDegeneration" ) !=1 :
			upgrades["Omniscience"] = 0
			upgrades["OccularDegeneration"] = 0
		pass
	if upgrades.get("Pulmonatization" ) ==1 :
		if upgrades.get("ExoSkeleton" ) !=1 && upgrades.get("PoisonTrail" ) !=1 :
			upgrades["ExoSkeleton"] = 0
			upgrades["PoisonTrail"] = 0
		pass
	if upgrades.get("Radula" ) ==1 :
		if upgrades.get("ExtraTooth" ) !=1 && upgrades.get("NeuroToxinPoison" ) !=1 :
			upgrades["ExtraTooth"] = 0
			upgrades["NeuroToxinPoison"] = 0
		pass
	if upgrades.get("Arachnopod" ) ==1 :
		if upgrades.get("ApexPredator" ) !=1 && upgrades.get("AllTerrain" ) !=1 :
			upgrades["ApexPredator"] = 0
			upgrades["AllTerrain"] = 0
		pass
	if upgrades.get("Aposematism" ) ==1 :
		if upgrades.get("Toxic" ) !=1 && upgrades.get("FroggingFast" ) !=1 :
			upgrades["Toxic"] = 0
			upgrades["FroggingFast"] = 0
		pass
	print(upgrades)
	pass


func switchWeapon():
	pass
	
