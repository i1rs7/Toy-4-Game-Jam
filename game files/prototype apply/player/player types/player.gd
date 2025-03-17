extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const TRAMP_BOUNCE_VELOCITY = -575.0

func _on_ready() -> void:
	#get_child(0).shape.radius = get_parent().radius
	#get_child(1).mesh.radius = get_parent().radius
	#get_child(1).mesh.height = 2*get_parent().radius
	pass


func _physics_process(delta: float) -> void:
	move(delta)
	handle_collisions()


func move(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta # Add the gravity.
	if self.get_meta("selected"): # only evaluate movement if the node is selected
		if Input.is_action_just_pressed("ui_up") and is_on_floor(): velocity.y = JUMP_VELOCITY # Handle jump.
		velocity.x = Input.get_axis("ui_left","ui_right") * SPEED # move based on left and right
		if Input.get_axis("ui_left","ui_right") == 1: #handle animation move right
			$AnimatedSprite2D.play("move_right")
		if Input.get_axis("ui_left","ui_right") == -1: #handle animation move left
			$AnimatedSprite2D.play("move_left")
	
	move_and_slide() # Move by velocity.


func handle_collisions():
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if collision == null: continue
		var collider = collision.get_collider()
		if collider.is_in_group("doors") and get_meta("key"):
			collider.queue_free()
			set_meta("key", false)
		elif collider.is_in_group("keys"):
			collider.queue_free()
			set_meta("key", true)
		elif collider.is_in_group("trampolines") and position.y < collider.position.y:
			velocity.y = TRAMP_BOUNCE_VELOCITY
