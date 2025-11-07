extends Area3D

# In the script attached to the Area3D or a parent node
func _ready():
	self.body_entered.connect(_on_Area3D_body_entered)

func _on_Area3D_body_entered(body: Node3D):
	print("Body entered: ", body.name)
