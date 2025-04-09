class_name BTNodeOLD
extends Node

enum Status {
	READY,
	RUNNING,
	CANCELLED,
	FAILED,
	SUCCEEDED
}

@onready var btnode_parent: BTNode 
@onready var bt_children: Array[BTNode] = get_bt_children()

var blackboard: BTBlackboard
var control = null
var status = Status.READY


func _ready() -> void:
	setup_parent()
	

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

func _start():
	status = Status.RUNNING

func _tick():
	pass

func _cancel():
	pass

func _reset():
	status = Status.READY
