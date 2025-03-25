extends Node2D

const SPEED = 60
var direction = 1

#ray cast is a node within the slime node that detects things around it
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_left_down = $RayCastLeftDown
@onready var ray_cast_right_down = $RayCastRightDown
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#direction dictates positive or negative for position.x
	#positive is right, negative is left
	if ray_cast_right.is_colliding() or !ray_cast_right_down.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding() or !ray_cast_left_down.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
