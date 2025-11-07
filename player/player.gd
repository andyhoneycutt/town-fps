extends CharacterBody3D

@export var speed = 3.0
@export var jump_velocity = 4.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func handle_move():
	# make the character move "forward" in the direction of the camera
	var camera_transform = $CameraSwivel.get_child(0).global_transform
	var camera_forward = -camera_transform.basis.z
	var camera_right = camera_transform.basis.x
	var input_vector = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		input_vector += camera_forward
	if Input.is_action_pressed("move_backward"):
		input_vector -= camera_forward
	if Input.is_action_pressed("move_left"):
		input_vector -= camera_right
	if Input.is_action_pressed("move_right"):
		input_vector += camera_right
	input_vector = input_vector.normalized()

	# Apply movement to the character (e.g., using move_and_slide or another physics method)
	velocity = input_vector * speed
	velocity.y = 0
	move_and_slide()

func _physics_process(delta):
	handle_move()
