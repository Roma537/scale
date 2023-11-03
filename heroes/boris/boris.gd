extends CharacterBody2D

@onready var diolog = $"ДиологовоеОкноДляДвери"
@onready var dioilogBoris = $"ДиологовоеОкно2"
@onready var txt = $Label
@onready var darkVuport = $DarkVuport

var study = 1
var enterd = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	if enterd == true:
		if study == 1:
			diolog.show()
		if Input.is_action_pressed("q"):
			dioilogBoris.show()
			diolog.hide()
			study = 2
			pass
	elif enterd == false:
		diolog.hide()
	if study == 2:
		if Input.is_action_pressed("q"):
			study = 3
			txt.text = 'В этом мире все 
			могут увиличиваться и 
			уменьшаться. Ты тоже это 
			мог делать, но сейчас 
			ты так не умеешь.'
	if study == 3:
		await get_tree().create_timer(0.2).timeout
		if Input.is_action_pressed("q"):
			study = 4
			txt.text = 'Это всё 
			потаму что, ты потерял все
			5 предметов для маштабирывания.
			тебе предстоит их найти что бы
			не выделятся из всех'
	if study == 4:
		await get_tree().create_timer(1).timeout
		if Input.is_action_pressed("q"):
			study = 5
			darkVuport.show()
			await get_tree().create_timer(5).timeout
			get_tree().quit()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
func _on_area_2d_body_entered(body):
	if body.name == "player":
		enterd = true 
func _on_area_2d_body_exited(body):
	
	if body.name == "player":
		enterd = false

























