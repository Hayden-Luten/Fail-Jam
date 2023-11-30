extends Node2D




func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/level1.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelScenes/Main.tscn")
