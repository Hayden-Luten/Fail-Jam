extends Node2D

@onready var player = $player
@onready var ball = $ball

func pickBall():
	ball.reparent(player)

func _process(_delta):

	pass


func _on_fell_body_entered(body):
	body.global_position.x = 0
	body.global_position.y = 0
