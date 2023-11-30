extends CharacterBody2D

var interacting = false
var gravity = 10
var speed = 3

func _process(_delta):
	if !get_parent().is_in_group("player"):
		velocity.y += gravity
		if is_on_floor():
			velocity.x = move_toward(velocity.x, 0, speed)
		move_and_slide()


func _input(event : InputEvent):
	if (event.is_action_pressed("interact")):
		if interacting == true:
			if !get_parent().is_in_group("player"):
				get_parent().pickBall()
			else:
				velocity.y = get_parent().velocity.y - 100
				velocity.x = get_parent().velocity.x
				get_parent().release()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"): 
		interacting = true



func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		interacting = false
