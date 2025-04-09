class_name BTLeafJustSayHiOLD
extends BTNodeOLD

var said_hi: bool = false

func tick():
	say_hi()
	if said_hi:
		status = Status.SUCCEEDED

func say_hi():
	await get_tree().create_timer(randi_range(1,3)).timeout
	print("hi!")
	said_hi = true

func _reset():
	super._reset()
	said_hi = false
