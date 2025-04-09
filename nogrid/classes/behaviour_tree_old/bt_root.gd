class_name BTRootOLD
extends BTNodeOLD

##Assegna la risorsa blackboard
@export var blackboard_template: BTBlackboard
##Assegna il personaggio agente
@export var character_agent: CharacterController

var current_bt_node: int = 0

func _ready():
	blackboard_init()
	setup_parent()
	_start()

func _process(delta):
	if (Engine.get_process_frames() % 5) == 0:
		tick()

func blackboard_init():
	blackboard = blackboard_template.duplicate(true)
	blackboard.health = blackboard.health
	blackboard.food = blackboard.food

func tick():
	var child: BTNode = bt_children[current_bt_node]
	if child.status == Status.RUNNING:
		await child.tick()
	elif child.status == Status.SUCCEEDED:
		child._reset()
		current_bt_node += 1
		if current_bt_node == bt_children.size():
			reset()
		else:
			child = bt_children[current_bt_node]
			child._start()
	
	
	

func setup_parent():
	var parent = get_parent()
	if parent is CharacterController:
		blackboard.character_controller = parent

func get_all_running_bt_nodes():
	if status == Status.RUNNING:
		print("Io in corsa")
	for child in bt_children:
		if child.status == Status.RUNNING:
			print ("figlio in corsa")

func _start():
	bt_children[0]._start()

func reset():
	super._reset()
	current_bt_node = 0
	print("resettato root")
	_start()
