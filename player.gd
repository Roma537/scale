extends CharacterBody3D

var speed = 0.0
@onready var head = $head
@onready var cam = $head/cam

const walk_SPEED = 5.0
const run_SPEED = 8.0
const SENS = 0.003
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const bob_freq = 2.0
const bob_amp = 0.08
var bob = 0.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func  _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENS)
		cam.rotate_x(-event.relative.y * SENS)
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
	if Input.is_action_pressed("shift"):
		speed = run_SPEED
	else:
		speed = walk_SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("a", "d", "w", "s")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
			
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 2.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 2.0)

	#hb 
	bob += delta * velocity.length() * float(is_on_floor())
	cam.transform.origin = _headbob(bob)
	

	
	
	move_and_slide()
func  _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * bob_freq) * bob_amp
	pos.x = cos(time * bob_freq / 2) * bob_amp
	return pos
