extends Camera2D


func _process(delta):
	var players = get_tree().get_nodes_in_group("player")
	if players.empty():
		assert(false, "No player found for camera to follow")
		
	var player: Node2D = players.front()
	self.position = self.position.linear_interpolate(player.position, 0.2)
