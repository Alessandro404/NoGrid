class_name BTLeafMoveRandom
extends BTNode


func tick():
	go_to_random_place():
	var map = blackboard.character_controller.get_world_3d().navigation_map
	var random_point = NavigationServer3D.map_get_random_point(map, 1, false)
	blackboard.character_controller.move_to_position(random_point, true)
