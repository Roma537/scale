extends Node2D

@onready var ru = $ru
@onready var en = $en

# кнопки и их действия
func _on_quit_button_down():
	get_tree().quit()
func _on_play_button_down():
	if Menu.newMenu == false:
		get_tree().change_scene_to_file("res://scens/levels/level1.tscn")
#		get_tree().change_scene_to_file("res://scens/levels/3d_level.tscn")
	if Menu.newMenu == true:
		get_tree().change_scene_to_file("res://scens/menu_for_level.tscn")



#	if Global.ui == false:
#		Global.ui = true
#	if Global.ui == true:
#		Global.ui = false


func _on_mobil_pressed():
	ru.hide()
	en.show()
	Leng.leng = "ru"
func _on_pc_pressed():
	ru.show()
	en.hide()
	Leng.leng = "en"
