extends Node2D


# кнопки и их действия
func _on_quit_button_down():
	get_tree().quit()
func _on_play_button_down():
	get_tree().change_scene_to_file("res://scens/levels/level1.tscn")
