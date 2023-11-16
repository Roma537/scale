extends RigidBody3D

var size = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_area_3d_body_entered(body):
	if body.name == "player":
		if size == 1:
			Global.readi = [1,1,0,0,0]
		if size == 2:
			Global.readi = [1,1,1,0,0]
		if size == 3:
			Global.readi = [1,1,1,1,0]
		if size == 4:
			Global.readi = [1,1,1,1,1]
		hide()
		await get_tree().create_timer(3).timeout
		show()
		size = size + 1
