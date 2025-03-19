extends CharacterBody2D

const KEY = preload("res://game files/prototype apply/elements/key/key.tscn")

const SPEED = 600.0
const JUMP_VELOCITY = -700.0
const TRAMP_BOUNCE_VELOCITY = -950.0

var player_has_key = false
var player_key_above_head = false 

func _on_ready() -> void:
	pass



func _physics_process(delta: float) -> void:
	move(delta)
	handle_collisions()
	if get_meta("key"):
		self.get_node("key").visible = true


func move(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta # Add the gravity.
	if self.get_meta("selected"): # only evaluate movement if the node is selected
		if Input.is_action_just_pressed("ui_up") and is_on_floor(): velocity.y = JUMP_VELOCITY # Handle jump.
		velocity.x = Input.get_axis("ui_left","ui_right") * SPEED # move based on left and right
		player_animation()
	move_and_slide() # Move by velocity.


func handle_collisions():
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if collision == null: continue
		var collider = collision.get_collider()
		if collider.is_in_group("doors") and get_meta("key") and collider.state:
			collider.state = false
			set_meta("key", false)
			self.get_node("key").visible = false
		elif collider.is_in_group("keys"):
			collider.queue_free()
			set_meta("key", true)
		elif collider.is_in_group("trampolines") and collider.state and position.y < collider.position.y:
			velocity.y = TRAMP_BOUNCE_VELOCITY
			collider.play_animation()
			
			
func player_animation():
	if Input.get_axis("ui_left","ui_right") == 1:
		$AnimatedSprite2D.play("move_right")
	elif Input.get_axis("ui_left","ui_right") == -1:
		$AnimatedSprite2D.play("move_left")
	elif Input.get_axis("ui_left","ui_right") == 0:
		$AnimatedSprite2D.frame = 0


func set_key_position(key):
	key.position.x = self.position.x/20
	key.position.y = self.position.y/20 -25
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_class("CharacterBody2D") and self != body:
		get_parent().merge()
