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
	var counter = 1
	while counter<10 and self.position.y < 240:
		counter +=1
		self.position.y += 0.05

func enable():
	get_child(1).hide()
	get_child(0).show()
	get_child(2).disabled = false
