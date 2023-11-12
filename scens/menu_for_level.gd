extends Node2D



func _ready():
	pass 
func _process(delta):
	pass



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scens/menu.tscn")


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scens/levels/3d_level.tscn")
