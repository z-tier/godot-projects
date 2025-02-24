extends Area2D

@onready var player1_points = $"../Points/Player1Points"

var points = 0

func _on_body_entered(body: CharacterBody2D) -> void:
	points += 1
	player1_points.text = str(points)
	$"../ScoredSFX".play()
