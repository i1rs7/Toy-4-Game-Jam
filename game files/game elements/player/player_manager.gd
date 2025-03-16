extends Node2D

var player_scene = preload("res://game files/game elements/player/player.tscn")
var players = [] # holds adresses of all children
var selected_index = 0 # holds index of selected child

func _ready() -> void:
	for child in get_children(): players.append(child) # put all children adresses into players list
	players[selected_index].set_meta("selected", true) # select current player: default is so we must select to start.


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"): cycle_selection()
	if Input.is_action_just_pressed("spawn"): add_branch()


func add_branch():
	var branch = player_scene.instantiate() # create instance
	branch.attributes = players[selected_index].attributes.duplicate() # copy attributes over
	branch.position = players[selected_index].position + Vector2(20,0) # move new player to desired position
	branch.ancestor = players[selected_index] # set ancestor for merge evaluation
	players.append(branch) # add player ID
	add_child(branch) # add new player to children
	
	# uncomment this code if you want to select the new branch on creation
	# note that we must add child before setting meta, I think because the meta is on the node, and not the object or something.
	#players[selected_index].set_meta("selected", false) # deselect current player
	#selected_index = players.size() - 1 # update selected index to be new player
	#players[selected_index].set_meta("selected", true) # select new player

func cycle_selection():
	players[selected_index].set_meta("selected", false) # deselect current player
	selected_index = (selected_index + 1) % players.size() # cycle index
	players[selected_index].set_meta("selected", true) # select new player


func find_common_ancestor(a, b) -> Node2D:
	for i in get_child_count():
		for j in i:
			if a.get_nth_ancestor(i) == b.get_nth_ancestor(j):
				return a.get_nth_ancestor(i)
	return 
		
		

func merge(kept_body, merged_body):
	var new_attributes = kept_body.attributes.duplicate()
	for key in kept_body.attributes:
		if kept_body.attributes[key] != merged_body.attributes[key]:
			var ancestor = find_common_ancestor(kept_body, merged_body)
			print(ancestor)

	
	
	if merged_body.get_meta("selected"): # if we are merging the selected body, we must select a new one
		merged_body.set_meta("selected", false) # update metas
		kept_body.set_meta("selected", true)
	players.erase(merged_body) # remove merged body from list
	for index in players.size(): # now we will just loop through the players and update selected index based on meta data. its o(n) but we shouldn't have too many objects and im too lazy to deal with edge cases rn 
		if players[index].get_meta("selected"): # if its selected in metadata,
			selected_index = index # update selected index
			break # no need to continue
	merged_body.free() # lastly, we delete the merged body
