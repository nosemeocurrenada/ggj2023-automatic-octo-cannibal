extends GameScene

const block_scene = preload("res://objects/games/bloques/block.tscn")
const REQUIRED_BLOCKS = 4
var won = false

func is_any_action_just_pressed():
	return (
		Input.is_action_just_pressed("ui_accept") or
		Input.is_action_just_pressed("ui_right") or 
		Input.is_action_just_pressed("ui_down") or 
		Input.is_action_just_pressed("ui_up") or 
		Input.is_action_just_pressed("ui_left")
	)

func all_blocks_are_still():
	for node in get_tree().get_nodes_in_group("block"):
		if not node.is_still():
			return false
	return true
	
func amount_of_still_blocks():
	var c = 0
	for node in get_tree().get_nodes_in_group("block"):
		if node.is_still():
			c += 1
	return c

func _process(delta):
	var aosb = amount_of_still_blocks()
	if aosb >= REQUIRED_BLOCKS:
		if not won:
			$counter.queue_free()
			won = true
			for node in get_tree().get_nodes_in_group("block"):
				node.mode = RigidBody2D.MODE_STATIC
				node.reveal_buildings()
			$ending_timer.wait_time = 4
			$ending_timer.start()
	else:
		$counter.text = "%s" % (REQUIRED_BLOCKS - aosb)
		if is_any_action_just_pressed():
			if all_blocks_are_still():
				create_moving_block()
	
func create_moving_block():
	var block = block_scene.instance()
	block.position = $block_start.position
	add_child(block)


func _on_ocean_body_entered(body: Node2D):
	if body.is_in_group("block"):
		body.queue_free()


func _on_ending_timer_timeout():
	get_tree().change_scene("res://scenes/consigue_ingrediente_Asombro.tscn")
