extends Node2D

@onready var levelLab = $Control/Panel/levelLabel
@onready var timeLab = $Control/Panel/timeLabel

func displayReset():
	gv.loadGame()
	levelLab.text = "level : " + str(gv.level[1]) + "
	" + "level : " + str(gv.level[2]) + "
	" + "level : " + str(gv.level[3])
	timeLab.text =  "time : " + str(gv.round_to_dec(gv.time[1], 3)) + "
	" + "time : " + str(gv.round_to_dec(gv.time[2], 3)) + "
	" + "time : " + str(gv.round_to_dec(gv.time[3], 3))

func _ready():
	displayReset()

func _on_save_1_pressed():
	gv.saveNum = 1
	gv.loadGame()
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/levelSelect.tscn")

func _on_save_2_pressed():
	gv.saveNum = 2
	gv.loadGame()
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/levelSelect.tscn")


func _on_save_3_pressed():
	gv.saveNum = 3
	gv.loadGame()
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/levelSelect.tscn")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/Main.tscn")


func _on_delete_save_1_pressed():
	gv.time[1] = 0
	gv.level[1] = 1
	gv.saveGame()
	displayReset()


func _on_delete_save_2_pressed():
	gv.time[2] = 0
	gv.level[2] = 1
	gv.saveGame()
	displayReset()

func _on_delete_save_3_pressed():
	gv.time[3] = 0
	gv.level[3] = 1
	gv.saveGame()
	displayReset()
