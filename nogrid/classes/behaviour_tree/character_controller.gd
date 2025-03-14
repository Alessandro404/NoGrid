class_name CharacterController
extends CharacterBody3D

@export var health: int 
## Valore da 0 a 100
@export var food: int
@export var walk_speed: float = 5

var move_direction : Vector3
var is_stopped: bool = false

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var gravity : float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	var target_pos = nav_agent.get_next_path_position()
	var move_dir = position.direction_to(target_pos)
	move_dir.y = 0
	move_dir = move_dir.normalized()
	
	#non muoverti se l'agente è fermo o il personaggio è bloccato.
	if nav_agent.is_navigation_finished() or is_stopped:
		move_dir = Vector3.ZERO
	
	velocity.x = move_dir.x * walk_speed
	velocity.z = move_dir.z * walk_speed
	
	move_and_slide()

func move_to_position(to_position : Vector3, adjust_pos : bool = false):
	is_stopped = false
	
	if adjust_pos:
		var map = get_world_3d().navigation_map
		var adjusted_pos = NavigationServer3D.map_get_closest_point(map, to_position)
		nav_agent.target_position = adjusted_pos
	else:
		nav_agent.target_position = to_position
