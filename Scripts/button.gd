extends Node2D

var currentBody

func _on_collider_body_entered(body):
	currentBody = body
	$button.frame = 1
	gv.buttonPress = true

func _on_collider_body_exited(body):
	if currentBody == body:
		$button.frame = 0
		gv.buttonPress = false
		currentBody = ""
