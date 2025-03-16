extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var text = $PanelContainer/Label
@onready var ancestor = self # only stays self for parent branch
# These dictionaries must have the same keys. changes is strings, and attributes is vals. must be in same order as well
var attributes = {
	"keys": 0
}
var changes = {
	"keys": ""
}

func get_nth_ancestor(n):
	if n == 0: return self
	else: return ancestor.get_nth_ancestor(n-1)


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
		if Input.get_axis("ui_left","ui_right"): velocity.x = Input.get_axis("ui_left","ui_right") * SPEED # move based on left and right
	move_and_slide() # Move by velocity.


func handle_collisions():
	for index in get_slide_collision_count(): # for every collision:
		var collider = get_slide_collision(index).get_collider() # get the object collided with
		if collider.name == "Key": # if its a key,
			collider.free() # destroy the key
			attributes["keys"] += 1 # add a key to data
		if Input.is_action_pressed("merge") and collider.is_in_group("players"):
			get_parent().merge(self, collider)


func update_text():
	var new_text = "" # create placeholder string to change instead of changing label text
	for attribute in attributes:
		new_text += attribute + ": " + str(attributes[attribute]) + "\n" # add the attribute name and value
	new_text.strip_edges() # remove leading and trailing whitespace
	text.text = new_text # set label text to placeholder text
