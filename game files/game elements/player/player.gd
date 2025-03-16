extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0
@onready var text = $PanelContainer/Label
var attributes = {
	"keys": 0
}

func _on_ready() -> void:
	set_meta("selected", false)


func _physics_process(delta: float) -> void:
	move(delta)
	handle_collisions()
	update_text()

func move(delta: float) -> void:
	velocity.x = 0 # don't move x if not selected, set movement in selected if loop
	if not is_on_floor(): velocity += get_gravity() * delta # Add the gravity.
	if self.get_meta("selected"): # only evaluate movement if the node is selected
		if Input.is_action_just_pressed("ui_up") and is_on_floor(): velocity.y = JUMP_VELOCITY # Handle jump.
<<<<<<< Updated upstream
		if Input.get_axis("ui_left","ui_right"): 
			velocity.x = Input.get_axis("ui_left","ui_right") * SPEED # move based on left and right
			if Input.get_axis("ui_left","ui_right") == 1: #handling animations
				$cat.play("move_right")
			if Input.get_axis("ui_left","ui_right") == -1:
				$cat.play("move_left")
=======
		if Input.get_axis("ui_left","ui_right"): velocity.x = Input.get_axis("ui_left","ui_right") * SPEED # move based on left and right
		if Input.get_axis("ui_left","ui_right") ==1: #animation right
			$cat.play("move_right")
		if Input.get_axis("ui_left","ui_right") ==-1: #animation left
			$cat.play("move_left")
>>>>>>> Stashed changes
	move_and_slide() # Move by velocity.

func handle_collisions():
	for index in get_slide_collision_count(): # for every collision:
		var collider = get_slide_collision(index).get_collider() # get the object collided with
		if collider.name == "Key": # if its a key,
			collider.queue_free() # destroy the key
			attributes["keys"] += 1 # add a key to data


func update_text():
	var new_text = "" # create placeholder string to change instead of changing label text
	for attribute in attributes:
		new_text += attribute + ": " + str(attributes[attribute]) + "\n" # add the attribute name and value
	new_text.strip_edges() # remove leading and trailing whitespace
	text.text = new_text # set label text to placeholder text

