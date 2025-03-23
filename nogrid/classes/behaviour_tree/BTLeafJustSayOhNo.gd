class_name BTLeafJustSayOhNo
extends BTNode

var said_oh_no: bool = false

func tick():
	say_hi()
	if said_oh_no:
		status = Status.SUCCEEDED

func say_hi():
	await get_tree().create_timer(randi_range(1,3)).timeout
	print("Oh No!")
	said_oh_no = true

func _reset():
	super._reset()
	said_oh_no = false
