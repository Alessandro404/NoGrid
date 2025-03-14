class_name BTBlackboard
extends Resource


var health: int = 0
var character_controller: CharacterController
var bt_root : BTRoot
## Valore da 0 a 100
var food: int = 100:
	set(value): 
		if value > 100: value = 100 
		elif value < 0: value = 0
		else: food = value
