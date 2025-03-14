class_name BTNode
extends Node

enum {
	STARTING,
	RUNNING,
	CANCELLED,
	FAILED,
	SUCCEEDED
}

var control = null
var tree = null
var guard = null
var status = STARTING

func _tick():
	print("node tick")
