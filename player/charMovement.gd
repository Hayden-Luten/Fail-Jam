extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var texture = $texture


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1500


func _physics_process(delta):

		

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if !animation.is_playing:
			animation.play("charWalk")
		if direction == 1:
			texture.flip_h = true
		elif direction == -1:
			texture.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.stop()
		texture.frame = 0

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animation.stop()
		texture.frame = 1
	move_and_slide()



	
func release():
	$ball.reparent(get_parent())
