class_name BTNode
extends Node

enum {
	STARTING,
	RUNNING,
	CANCELLED,
	FAILED,
	SUCCEEDED
}

@onready var btnode_parent: BTNode 
@onready var bt_children: Array[BTNode] = get_bt_children()

var blackboard: BTBlackboard
var control = null
var guard = null
var status = STARTING
var is_root : bool = false


func _ready() -> void:
	setup_parent()
	
	
func _tick() -> void:
	pass

func setup_parent():
	#Attendi un frame per assicurare che tutto l'albero sia inizializzato
	await get_tree().process_frame
	var parent = get_parent()
	if parent is BTNode:
		btnode_parent = parent
		blackboard = parent.blackboard

func get_bt_children() -> Array[BTNode]:
	var children: Array[BTNode]
	for i in get_child_count():
		var child = get_child(i)
		if child is BTNode:
			children.append(child)
	return children
