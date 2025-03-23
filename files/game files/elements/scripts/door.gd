extends StaticBody2D

@export var opened_by_key = false
@export var initial_state = true
@export var slow_open = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass


func button_update(state: bool):
	if state != initial_state: enable()
	else: disable()


func disable():
	if slow_open: lower_door()
	else: get_child(0).self_modulate.a = 0.25
	get_child(1).set_deferred("disabled", true)
	

func enable():
	get_child(1).set_deferred("disabled", false)
	get_child(0).self_modulate.a = 1

func lower_door():
	var counter = 1
	while counter<10 and self.position.y < 242:
		counter +=1
		self.position.y += 0.05
