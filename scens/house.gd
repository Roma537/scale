extends Node2D

@onready var ui = $CanvasLayer/q
@onready var diolog = $diologDor
var enterd = false
var presedQ = false

func _ready():
	if Global.ui == false:
			ui.hide()
	if Global.ui == true:
		ui.show()

func _process(delta):
	if enterd == true:
		if Input.is_action_pressed("q"):
			get_tree().change_scene_to_file("res://scens/for_house.tscn")
		if presedQ:
			get_tree().change_scene_to_file("res://scens/for_house.tscn")

	pass


func _on_area_2d_body_entered(body):
	enterd = true
	diolog.show()
func _on_area_2d_body_exited(body):
	enterd = false
	diolog.hide()
func _on_q_button_down():
	presedQ = true
func _on_q_button_up():
	presedQ = false
