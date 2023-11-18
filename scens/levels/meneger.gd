extends Node

@onready var music = $"../AudioStreamPlayer"
@onready var player = $"../player"

var one = Global.readi[0]
var two = Global.readi[1]
var three = Global.readi[2]
var fore = Global.readi[3]
var five = Global.readi[4]
var six = Global.size
var seven = Global.Jamp

@onready var value = $"../ui/settings/settings/VBoxContainer/HBoxContainer/HSlider"
@onready var settings = $"../ui/settings"
@onready var pauseMenu = $"../ui/pauseMenu"
var game_paused = false 
var savePath = "user://saveGame.save"
 
func  _ready():
	loadGame()

func  _process(delta):
	one = Global.readi[0]
	two = Global.readi[1]
	three = Global.readi[2]
	fore = Global.readi[3]
	five = Global.readi[4]
	six = Global.size
	seven = Global.Jamp
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
		
	if game_paused == true:
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pauseMenu.show()
	else:
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pauseMenu.hide()
		settings.hide()
	music.volume_db = value.value
	if Global.readi[0] == 1:
		if Global.size == 1:
			player.scale.x = 1
			player.scale.y = 1
			player.scale.z = 1
	if Global.readi[1] == 1:
		if Global.size == 2:
			player.scale.x = 2
			player.scale.y = 2
			player.scale.z = 2
	if Global.readi[2] == 1:
		if Global.size == 3:
			player.scale.x = 3
			player.scale.y = 3
			player.scale.z = 3
	if Global.readi[3] == 1:
		if Global.size == 4:
			player.scale.x = 4
			player.scale.y = 4
			player.scale.z = 4
	if Global.readi[4] == 1:
		if Global.size == 5:
			player.scale.x = 5
			player.scale.y = 5
			player.scale.z = 5

func _on_resume_pressed():
	game_paused = !game_paused
func _on_quit_pressed():
	saveGame()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scens/menu.tscn")



func saveGame ():
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	file.store_var(player.position.x)
	file.store_var(player.position.y)
	file.store_var(player.position.z)

func loadGame ():
	var file = FileAccess.open(savePath, FileAccess.READ)
	player.position.x = file.get_var(player.position.x)
	player.position.y = file.get_var(player.position.y)
	player.position.z = file.get_var(player.position.z)

	pass


func _on_settings_pressed():
	pauseMenu.hide()
	settings.show()


func _on_in_the_menu_pressed():
	pauseMenu.show()
	settings.hide()







