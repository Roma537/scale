extends CharacterBody2D

var enterd = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if enterd == true:
		pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	move_and_slide()


func _on_area_2d_body_entered(body):
	enterd = true 


func _on_area_2d_body_exited(body):
	enterd = false
