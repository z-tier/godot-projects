extends CharacterBody2D

@onready var jetpack1: GPUParticles2D = $Jetpack/JetpackFX
@onready var jetpack2: GPUParticles2D = $Jetpack/JetpackFX2

@export var flight_speed = 400.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("fly"):
		velocity += Vector2.UP * flight_speed * delta
		jetpack1.emitting = true
		jetpack2.emitting = true
	else:
		velocity += get_gravity() * delta
		jetpack1.emitting = false
		jetpack2.emitting = false

	
	move_and_slide()
