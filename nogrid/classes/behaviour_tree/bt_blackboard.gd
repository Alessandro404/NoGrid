class_name BTBlackboard
extends Resource

@export var dict: Dictionary = {}
@export var health: int = 0

## Valore da 0 a 100
@export var food: int = 100:
	set(value): 
		if value > 100: value = 100 
		elif value < 0: value = 0
		else: food = value
