extends Character
const ROTATION_SPEED_FACTOR = 0.3
const CAMERA_DIVISOR = 6
const CAMERA_SPEED_FACTOR = 0.7

onready var camera = $Camera2D

func _process(_delta):
	var mouse_position = get_global_mouse_position()
	var mouse_direction = (mouse_position - global_position).normalized()
	rotation = lerp_angle(global_rotation, mouse_direction.angle(), ROTATION_SPEED_FACTOR)
	
	# Make camera follow mouse
	var point_between_mouse_and_char = (mouse_position - global_position) / CAMERA_DIVISOR
	camera.global_position = lerp(camera.global_position, point_between_mouse_and_char + global_position, CAMERA_SPEED_FACTOR)

func get_input():
	mov_direction = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("move_up"):
		mov_direction += Vector2.UP
	if Input.is_action_pressed("move_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		mov_direction += Vector2.RIGHT
