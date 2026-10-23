extends CharacterBody2D


const SPEED = 300.0
const MAX_FALL = 450
const GRAVITY = 1500

var JUMP_VELOCITY = -430.0
var can_move: bool = true

# Player's respawn point
var respawn_position: Vector2

func _physics_process(delta: float) -> void:
	#	During respawn animation, stop the player physics
	if not can_move:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y = min(velocity.y + GRAVITY * delta, MAX_FALL)

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		$JumpParticles.emitting = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
		
