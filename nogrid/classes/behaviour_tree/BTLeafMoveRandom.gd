class_name BTLeafMoveRandom
extends BTNode

var in_movement: bool = false

func tick():
	go_to_random_place()
	if !blackboard.character_controller.nav_agent.get_next_path_position() and in_movement:
		in_movement = false
		print("raggiunto posto")
		status = Status.SUCCEEDED

func go_to_random_place():
	if blackboard.character_controller.nav_agent.is_navigation_finished():
		await get_tree().create_timer(randi_range(1,3)).timeout
		in_movement = true
		var map = blackboard.character_controller.get_world_3d().navigation_map
		var random_point = NavigationServer3D.map_get_random_point(map, 1, false)
		blackboard.character_controller.move_to_position(random_point, true)
		print("test")

func _reset():
	super._reset()
	in_movement = false
