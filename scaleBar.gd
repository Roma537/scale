extends Control

@onready var active = [1, 0, 0, 0, 0]
@onready var size1 = $"HBoxContainer/маленький1"
@onready var size2 = $"HBoxContainer/маленький2"
@onready var size3 = $"HBoxContainer/маленький3"
@onready var size4 = $"HBoxContainer/маленький4"
@onready var size5 = $"HBoxContainer/маленький5"

var i: int = 0

func _ready():
	pass



func _process(delta):

	if Input.is_action_pressed("1"):
		Global.size = 1
	if Input.is_action_pressed("2"):
		Global.size = 2
	if Input.is_action_pressed("3"):
		Global.size = 3
	if Input.is_action_pressed("4"):
		Global.size = 4
	if Input.is_action_pressed("5"):
		Global.size = 5
	if active[0] == 1:
		size1.play("active")
		size2.play("no active")
		size3.play("no active")
		size4.play("no active")
		size5.play("no active")
	if active[1] == 1:
		size2.play("active")
		size1.play("no active")
		size3.play("no active")
		size4.play("no active")
		size5.play("no active")
	if active[2] == 1:
		size3.play("active")
		size2.play("no active")
		size1.play("no active")
		size4.play("no active")
		size5.play("no active")
	if active[3] == 1:
		size4.play("active")
		size2.play("no active")
		size3.play("no active")
		size1.play("no active")
		size5.play("no active")
	if active[4] == 1:
		size5.play("active")
		size2.play("no active")
		size3.play("no active")
		size4.play("no active")
		size1.play("no active")
	presed()

func presed():
	active = [0, 0, 0, 0, 0]
	if Global.readi[Global.size - 1] == 1:
		active[Global.size - 1] = 1
	


