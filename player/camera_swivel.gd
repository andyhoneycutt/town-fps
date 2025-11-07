extends Node3D

@export var mouse_sensitivity = 0.001
@export var rotation_y_offset = 0.0
@export var rotation_x_offset = 0.0


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotation_y_offset -= event.relative.x * mouse_sensitivity
		rotation_x_offset -= event.relative.y * mouse_sensitivity

		# Clamp the vertical rotation to prevent the camera from flipping
		rotation_x_offset = clamp(rotation_x_offset, -PI/2, PI/2) 

		# Apply the rotations to the camera's rotation
		rotation = Vector3(rotation_x_offset, rotation_y_offset, 0)
