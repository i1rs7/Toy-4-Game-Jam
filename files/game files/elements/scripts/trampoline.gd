extends StaticBody2D
var counter = 0

@export var state = true
@onready var disable_box_top: MeshInstance2D = $DisableBoxTop
@onready var disable_box_right: MeshInstance2D = $DisableBoxRight
@onready var disable_box_left: MeshInstance2D = $DisableBoxLeft
@onready var disable_box_collision: CollisionShape2D = $DisableBoxCollision


func _ready() -> void:
	hide_disable_box()
	pass


func _process(_delta: float) -> void:
	if state: enable()
	else: disable()
	
func play_animation():
	$AnimatedSprite2D.play()


func disable():
	$AnimatedSprite2D.show()
	show_disable_Box()
	put_up_disable_box()
	state = false

func enable():
	disable_box_collision.disabled = true
	lower_disable_box()
	$AnimatedSprite2D.show()
	state = true

func lower_disable_box():
	disable_box_collision.disabled = true
	var counter = 1
	while counter<10 and disable_box_top.position.y < 3 and disable_box_left.global_rotation_degrees > 0:
		counter +=1
		disable_box_top.position.y += 0.01
		disable_box_left.global_rotation_degrees -= 0.23
		disable_box_right.global_rotation_degrees += 0.23
	
func put_up_disable_box():
	disable_box_collision.disabled = false
	var counter = 1
	while counter<10 and disable_box_top.position.y >= -1:
		disable_box_top.position.y -= 0.01
		disable_box_left.global_rotation_degrees += 0.23
		disable_box_right.global_rotation_degrees -= 0.23
		counter +=1
	pass
	

func hide_disable_box():
	disable_box_top.hide()
	disable_box_left.hide()
	disable_box_right.hide()
	disable_box_collision.disabled = true
		

func show_disable_Box():
	disable_box_top.show()
	disable_box_left.show()
	disable_box_right.show()
	disable_box_collision.disabled = false
	
