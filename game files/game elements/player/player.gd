extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta # Add the gravity.
	if Input.is_action_just_pressed("ui_up") and is_on_floor(): velocity.y = JUMP_VELOCITY # Handle jump.
	if Input.get_axis("ui_left","ui_right"): velocity.x = Input.get_axis("ui_left","ui_right") * SPEED # move based on left and right
	else: velocity.x = 0 # don't move if sum is 0
	move_and_slide() # Move by velocity.
