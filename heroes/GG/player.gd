extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -250

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = Input.get_axis("a", "d")





func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("w") and is_on_floor() or Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction:
		velocity.x = (direction) * SPEED
		anim.play("run")
		if direction == 1:
			anim.flip_h = false
		elif direction == -1:
			anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idel")

	move_and_slide()





func _on_button_pressed():
	get_tree().change_scene_to_file("res://scens/menu.tscn")
func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scens/menu.tscn")
