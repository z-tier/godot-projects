extends Control

@onready var pause_opacity : ColorRect = $"../../PauseOpacity"
@onready var info_opacity : ColorRect = $".."

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		info_opacity.hide()
		pause_opacity.hide()

func _on_back_pressed() -> void:
	info_opacity.hide()
	pause_opacity.show()
