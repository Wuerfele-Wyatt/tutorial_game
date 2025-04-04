extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

#Get the gravity from the project settings to be synced w/ RigidBody Nodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#add gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
	#handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#Get the input directionand handle movement/deceleration
	#Should replaice UI actions w/ custom gameplay actions
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
