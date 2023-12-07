extends Node2D

@onready var player = $player
@onready var ball = $ball
@onready var wood = $wood

func pickBall():
	ball.reparent(player)
	ball.position.x = 0
	ball.position.y = 0

func _process(_delta):
	if gv.buttonPress:
		wood.global_position = Vector2(1000,1000)
	if !gv.buttonPress:
		wood.global_position = Vector2(96, 8)
	pass

func _on_fell_body_entered(_body):
	if gv.level[gv.saveNum] == 1:
		gv.level[gv.saveNum] = 2
		gv.saveGame()
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/levelSelect.tscn")
