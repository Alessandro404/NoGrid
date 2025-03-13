class_name BNode
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
