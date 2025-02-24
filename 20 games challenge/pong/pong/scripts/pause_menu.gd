extends Control

@onready var pause_opacity : ColorRect = $".."
@onready var info_opacity : ColorRect = $"../../InfoOpacity"

func _on_information_pressed() -> void:
	pause_opacity.hide()
	info_opacity.show()

func _on_exit_pressed() -> void:
	get_tree().quit()
