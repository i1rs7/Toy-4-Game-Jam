extends StaticBody2D

@export var state = true
@export var slow_open = true

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if state: enable()
	else: disable()


func disable():
	if slow_open: lower_door()
	else: queue_free()

func enable():
	get_child(1).hide()
	get_child(0).show()
	get_child(2).disabled = false

func lower_door():
	var counter = 1
	while counter<10 and self.position.y < 242:
		counter +=1
		self.position.y += 0.05
