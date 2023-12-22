extends Node2D

@onready var player = $player
@onready var ball = $ball
@onready var world = $world
@onready var bg = $bg/ParallaxBackground
func pickBall():
	ball.reparent(player)
	ball.position.x = 0
	ball.position.y = 0
	for i in range(5):
		print("hello")

func _process(_delta):
	if gv.buttonPress:
		world.erase_cell(0, Vector2i(5, 0))
		world.erase_cell(0, Vector2i(6, 0))
		world.erase_cell(0, Vector2i(5, 1))
		world.erase_cell(0, Vector2i(5, 2))
		world.erase_cell(0, Vector2i(5, 3))
		world.erase_cell(0, Vector2i(5, 4))
		world.erase_cell(0, Vector2i(5, 5))
		world.erase_cell(0, Vector2i(5, 6))
		world.erase_cell(0, Vector2i(5, 7))
		world.erase_cell(0, Vector2i(5, 8))
		world.erase_cell(0, Vector2i(5, 9))
	if !gv.buttonPress:
		world.set_cell(0, Vector2i(5, 0), 6, Vector2i(12, 0), 0)
		world.set_cell(0, Vector2i(6, 0), 6, Vector2i(13, 0), 0)
		world.set_cell(0, Vector2i(5, 1), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 2), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 3), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 4), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 5), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 6), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 7), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 8), 6, Vector2i(12, 1), 0)
		world.set_cell(0, Vector2i(5, 9), 6, Vector2i(12, 1), 0)
	bg.scroll_offset = Vector2(player.position.x , 0)


func _on_fell_body_entered(body):
	if body.is_in_group("player"):
		if gv.level[gv.saveNum] == 1:
			gv.level[gv.saveNum] = 2
		gv.saveGame()
		get_tree().change_scene_to_file("res://Scenes/LevelScenes/levelSelect.tscn")
	if body.name == ball.name:
		body.global_position = Vector2(0, 0)
