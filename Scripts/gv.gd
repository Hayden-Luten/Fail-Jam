extends Node

@onready var speed = 30000
@onready var level = [1, 1, 1, 1]
@onready var buttonPress = false
@onready var time = [0, 0, 0, 0]
@onready var saveNum

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)


func _exit_tree():
	if saveNum == 1 or 2 or 3:
		saveGame()

func save():
	var save1 = {
		"level" : gv.level[1],
		"time" : gv.time[1]
	}
	var save2 = {
		"level" : gv.level[2],
		"time" : gv.time[2]
	}
	var save3 = {
		"level" : gv.level[3],
		"time" : gv.time[3]
	}
	var saveDict = {
		"save1" : save1,	
		"save2" : save2,
		"save3" : save3
	}
	return saveDict

func saveGame():
	var gameSave = FileAccess.open("user://saveGame.save", FileAccess.WRITE)
	
	var jsonString = JSON.stringify(save())
	
	gameSave.store_line(jsonString)

func loadGame():
	if not FileAccess.file_exists("user://saveGame.save"):
		return
	
	var gameSave = FileAccess.open("user://saveGame.save", FileAccess.READ)

	while gameSave.get_position() < gameSave.get_length():
		var jsonString = gameSave.get_line()
		var json = JSON.new()
		var _parseResult = json.parse(jsonString)
		var nodeData = json.get_data()
		gv.level[1] = nodeData.save1.level
		gv.time[1] = nodeData.save1.time
		gv.level[2] = nodeData.save2.level
		gv.time[2] = nodeData.save2.time
		gv.level[3] = nodeData.save3.level
		gv.time[3] = nodeData.save3.time
