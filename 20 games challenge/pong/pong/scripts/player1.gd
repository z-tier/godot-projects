extends CharacterBody2D

@onready var ball = $"../Ball"

@export var pspeed1 = 400
@export var acceldecel1 = 5000

func _ready() -> void:
	var screen_size = get_viewport_rect().size
	position.x = screen_size.x / 12
	position.y = screen_size.y / 2

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("player1_up", "player1_down")
	
	if direction != 0:
		velocity.y = move_toward(velocity.y, direction * pspeed1, acceldecel1 * delta)
	else:
		velocity.y = move_toward(velocity.y, 0, acceldecel1 * delta)
	
	move_and_slide()
