class_name BTRoot
extends BTNode

@export var character_controller : CharacterController 
@export var blackboard_template: BTBlackboard
var blackboard: BTBlackboard
var home_pos
func _ready():
	home_pos = character_controller.position
	blackboard_init()

func _process(delta):
	if (Engine.get_process_frames() % 60) == 0:
		tick()

func blackboard_init():
	blackboard = blackboard_template.duplicate(true)
	blackboard.health = character_controller.health
	blackboard.food = character_controller.food

func tick():
	super._tick()
	#Questa roba funziona. Ho un root!
	var map = character_controller.get_world_3d().navigation_map
	var random_point = NavigationServer3D.map_get_random_point(map, 1, false)
	character_controller.move_to_position(random_point, true)
