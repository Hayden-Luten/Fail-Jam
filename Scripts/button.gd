extends Area2D

@onready var button = get_parent().get_node("buttonSprite")

func _process(_delta):
	if has_overlapping_bodies():
		button.frame = 107
		gv.buttonPress = true
	else:
		button.frame = 108
		gv.buttonPress = false
