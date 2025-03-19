extends Node2D

const CAT = preload("res://game files/prototype apply/player/player types/cat.tscn")
const OCTOCAT = preload("res://game files/prototype apply/player/player types/octocat.tscn")
const OCTOPUS = preload("res://game files/prototype apply/player/player types/octopus.tscn")


var split_distance = 20

func _ready() -> void:
	pass
	#for index in get_child_count(): get_child(index).ready.emit

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("spawn") and get_child_count() < 2: split()
	if Input.is_action_just_pressed("ui_accept") and get_child_count() > 1: swap()
	if Input.is_action_just_pressed("merge") and get_child_count() > 1: merge()

func merge():
	var cat = get_child(0)
	var oct = get_child(1)
	var octocat = OCTOCAT.instantiate()
	octocat.position = (cat.position+oct.position)/2
	add_child(octocat)
	octocat.set_meta("selected", true)
	octocat.set_meta("key", cat.get_meta("key") or oct.get_meta("key"))
	cat.queue_free()
	oct.queue_free()


func swap():
	get_child(0).set_meta("selected", !get_child(0).get_meta("selected"))
	get_child(1).set_meta("selected", !get_child(1).get_meta("selected"))

func split():
	var octocat = get_child(0)
	var cat = CAT.instantiate()
	var oct = OCTOPUS.instantiate()
	cat.position = octocat.position + Vector2(split_distance,0)
	oct.position = octocat.position - Vector2(split_distance,0)
	add_child(cat)
	add_child(oct)
	cat.set_meta("selected", true)
	oct.set_meta("selected", false)
	cat.set_meta("key", octocat.get_meta("key"))
	oct.set_meta("key", octocat.get_meta("key"))
	octocat.queue_free()
