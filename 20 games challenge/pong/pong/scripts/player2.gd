extends CharacterBody2D

@export var pspeed2 = 400
@export var acceldecel2 = 5000

func _ready() -> void:
	var screen_size = get_viewport_rect().size
	position.x = screen_size.x / 1.1
	position.y = screen_size.y / 2

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("player2_up", "player2_down")
	
	if direction != 0:
		velocity.y = move_toward(velocity.y, direction * pspeed2, acceldecel2 * delta)
	else:
		velocity.y = move_toward(velocity.y, 0, acceldecel2 * delta)
	
	move_and_slide()
