extends Node2D

@onready var ui = $ui

func _process(delta):
	if Global.ui == false:
		ui.hide()
	if Global.ui == true:
		ui.show()
