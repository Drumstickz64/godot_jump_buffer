tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("JumpBuffer", "Node", preload("jump_buffer.gd"), preload("jump_buffer.svg"))


func _exit_tree() -> void:
	remove_custom_type("JumpBuffer")
