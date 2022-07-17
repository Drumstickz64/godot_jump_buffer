extends Node

export var jump_action_name := "jump"
export var buffer_time := 0.15

var pressed_jump := false

var _reset_timer := Timer.new()


func _ready() -> void:
	_reset_timer.wait_time = buffer_time
	add_child(_reset_timer)
	_reset_timer.connect("timeout", self, "_on_ResetTimer_timeout")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(jump_action_name) and not pressed_jump:
		pressed_jump = true
		_reset_timer.start()


func _on_ResetTimer_timeout() -> void:
	pressed_jump = false


func reset() -> void:
	pressed_jump = false
	_reset_timer.stop()
