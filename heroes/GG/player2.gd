extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var left = $CanvasLayer/left
@onready var right = $CanvasLayer/right
@onready var up = $CanvasLayer/up

const SPEED = 700
const JUMP_VELOCITY = -1200

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 4000
var jamp = false
var direction2 = 0

func _ready():
	if Global.ui == false:
		left.hide()
		right.hide()
		up.hide()
	if Global.ui == true:
		left.show()
		right.show()
		up.show()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") or jamp == true and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction or direction2:
		velocity.x = (direction + direction2) * SPEED
		anim.play("run")
		if direction == 1 or direction2 == 1:
			anim.flip_h = false
		elif direction == -1 or direction2 == -1:
			anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idel")

	move_and_slide()


func _on_left_button_down():
	direction2 = -1
func _on_left_button_up():
	direction2 = 0
func _on_right_button_down():
	direction2 = 1
func _on_right_button_up():
	direction2 = 0
func _on_up_button_down():
	jamp = true
func _on_up_button_up():
	jamp = false
