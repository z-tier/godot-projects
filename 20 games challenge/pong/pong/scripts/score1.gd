extends Area2D

@onready var player2_points = $"../Points/Player2Points"

var points = 0

func _on_body_entered(body: CharacterBody2D) -> void:
	points += 1
	player2_points.text = str(points)
	$"../ScoredSFX".play()
