extends CharacterBody3D

@onready var navigationAgent := $NavigationAgent3D
@onready var camera := $"../Camera3D"

const RAY_LENGTH = 1000
const SPEED = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (navigationAgent.is_navigation_finished()):
		return
	moveToPoint(delta, SPEED)

func _input(_event):
	if Input.is_action_just_pressed("Left Mouse Button"):
		var mouse_pos = get_viewport().get_mouse_position()
		var from = camera.project_ray_origin(mouse_pos)
		var to = from + camera.project_ray_normal(mouse_pos) * RAY_LENGTH
		var space = get_world_3d().direct_space_state
		var ray_query = PhysicsRayQueryParameters3D.new()
		ray_query.from = from
		ray_query.to = to
		ray_query.collide_with_areas = true
		var result = space.intersect_ray(ray_query)
		print(result)
		if result: #Nel caso si clicchi fuori
			navigationAgent.set_target_position(result.position)


func moveToPoint(_delta, speed):
	var target_pos = navigationAgent.get_next_path_position()
	var direction = global_position.direction_to(target_pos)
	velocity = direction * speed
	faceDirection(target_pos)
	move_and_slide()


func faceDirection(direction):
	look_at(Vector3(direction.x, global_position.y, direction.z), Vector3.UP)
