extends Node2D

@onready var diolog = $diologDor
var enterd = false

func _process(delta):
	if enterd == true:
		if Input.is_action_pressed("q"):
			get_tree().change_scene_to_file("res://scens/for_house.tscn")
	pass


func _on_area_2d_body_entered(body):
	enterd = true
	diolog.show()
	


func _on_area_2d_body_exited(body):
	enterd = false
	diolog.hide()
	
