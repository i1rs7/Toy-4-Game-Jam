extends StaticBody2D

@export var state = true
@export var slow_open = true

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if state: enable()
	else: disable()


func disable():
	get_child(0).self_modulate.a = 0.25
	get_child(1).disabled = true

func enable():
	get_child(0).self_modulate.a = 1
	get_child(1).disabled = false

func lower_door():
	var counter = 1
	while counter<10 and self.position.y < 242:
		counter +=1
		self.position.y += 0.05
