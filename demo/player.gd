extends KinematicBody2D

var vel := Vector2.ZERO

onready var jump_buffer := $JumpBuffer


func _physics_process(delta: float) -> void:
	if is_on_floor() and (Input.is_action_just_pressed("jump") or jump_buffer.pressed_jump):
		jump()
	if Input.is_action_just_pressed("stomp") and not is_on_floor():
		stomp()
	
	vel.y = move_toward(vel.y, 450.0, 850.0 * delta)
	vel = move_and_slide(vel, Vector2.UP)


func jump() -> void:
	vel.y = -450


func stomp() -> void:
	vel.y = 5000
	jump_buffer.reset()
