extends Area3D

# In the script attached to the Area3D or a parent node
func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)	

func _on_Area3D_body_entered(body: Node3D):
	var brick_count = body.get("bricks")
	if not brick_count:
		return
	if brick_count >= 10:
		# remove transparency
		self.get_parent().set_surface_override_material(0, null)
		# enable collider
		self.get_parent().get_node("StaticBody3D/CollisionShape3D").call_deferred("set_disabled", false)
