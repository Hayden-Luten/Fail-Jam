extends Node2D

var currentBody

func _on_collider_body_entered(body):
	currentBody = body
	$up.hide()
	gv.buttonPress = true

func _on_collider_body_exited(body):
	if currentBody == body:
		$up.show()
		gv.buttonPress = false
		currentBody = ""
