extends Area2D

@onready var button = get_parent().get_node("buttonSprite")

func _process(_delta):
	if has_overlapping_bodies():
		button.frame = 1
		gv.buttonPress = true
	else:
		button.frame = 0
		gv.buttonPress = false
