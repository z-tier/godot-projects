extends Node2D

@onready var pause_menu: Control = $PauseOpacity

var paused = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
