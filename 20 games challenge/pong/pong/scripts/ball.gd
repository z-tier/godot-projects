extends CharacterBody2D

@onready var boost_timer : Timer = $BoostTimer
@onready var respawn_timer : Timer = $RespawnTimer
@onready var ball_scene : PackedScene = preload("res://scenes/ball.tscn")

@export var speed = 250.0

var baller : Node

var x = randf_range(-100, 100)
var y = randf_range(-40, 40)

func _ready() -> void:
	velocity = Vector2(x, y).normalized() * speed
	boost_timer.start()
	
	baller = get_node("Ball")

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		$Hit.play()

func _on_boost_timer_timeout() -> void:
	velocity *= 1.2
	boost_timer.start()

func _on_score_1_boundary_body_entered(body: CharacterBody2D) -> void:
	respawn_timer.start()
	
func _on_score_2_boundary_body_entered(body: CharacterBody2D) -> void:
	respawn_timer.start()

func _on_respawn_timer_timeout() -> void:
	ball_reset()

func ball_reset():
	if baller:
		baller.queue_free()
	
	baller = ball_scene.instantiate()
	get_parent().add_child(baller)
	
	respawn_timer.stop()
