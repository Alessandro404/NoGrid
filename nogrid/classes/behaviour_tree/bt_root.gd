class_name BTRoot
extends BTNode

##Assegna la risorsa blackboard
@export var blackboard_template: BTBlackboard
##Assegna il personaggio agente
@export var character_agent: CharacterController


func _ready():
	blackboard_init()
	setup_parent()

func _process(delta):
	if (Engine.get_process_frames() % 60) == 0:
		tick()

func blackboard_init():
	blackboard = blackboard_template.duplicate(true)
	blackboard.health = blackboard.health
	blackboard.food = blackboard.food

func tick():
	super._tick()
	for child in bt_children:
		child.tick()

func setup_parent():
	var parent = get_parent()
	if parent is CharacterController:
		blackboard.character_controller = parent
		is_root = true
