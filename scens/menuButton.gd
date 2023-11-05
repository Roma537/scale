extends Node2D

@onready var mobil = $mobil
@onready var pc = $pc

# кнопки и их действия
func _on_quit_button_down():
	get_tree().quit()
func _on_play_button_down():
	get_tree().change_scene_to_file("res://scens/levels/level1.tscn")



#	if Global.ui == false:
#		Global.ui = true
#	if Global.ui == true:
#		Global.ui = false


func _on_mobil_pressed():
	mobil.hide()
	pc.show()
	Global.ui = true
func _on_pc_pressed():
	mobil.show()
	pc.hide()
	Global.ui = false
