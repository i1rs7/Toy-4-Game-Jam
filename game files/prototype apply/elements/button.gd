extends StaticBody2D

var connections = [
	$"../Trampoline2" # this needs to be given a pointer to trampoline2 node/scene instance.
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func _on_area_2d_body_entered(_body: Node2D) -> void:
	for trampoline in connections:
		if trampoline == null: continue
		trampoline.add_to_group("trampolines")




func _on_area_2d_body_exited(_body: Node2D) -> void:
	for trampoline in connections:
		if trampoline == null: continue
		trampoline.remove_from_group("trampolines")
