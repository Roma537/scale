extends StaticBody3D

var size = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if size == 1:
		if body.name == "player":
			hide()
			Global.readi[1] = 1
			size + 1
			await get_tree().create_timer(5).timeout
			show()

			
