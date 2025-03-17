extends StaticBody2D


@export var state = true

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	if state: enable()
	else: disable()


func disable():
	get_child(0).hide()
	get_child(1).show()
	state = false

func enable():
	get_child(1).hide()
	get_child(0).show()
	state = true

	
