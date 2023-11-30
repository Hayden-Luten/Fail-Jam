extends Node

@onready var speed = 30000
@onready var level = 1
@onready var buttonPress = false

func _ready():
	loadGame()

func _exit_tree():
	saveGame()

func save():
	var saveDict = {
		"level" : gv.level
		
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
		var parseResult = json.parse(jsonString)
		var nodeData = json.get_data()
		
		gv.level = nodeData.level
