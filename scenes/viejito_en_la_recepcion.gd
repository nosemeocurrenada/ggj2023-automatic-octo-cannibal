extends GameScene


func _on_portal_to_kitchen_player_entered():
	yield(dialog("little_chef", "Necesito atender al viejo"), "done")


func _on_viejito_dialog():
	yield(dialog("little_chef", "Bienvenido"), "done")
	yield(dialog("viejito", "Oh, donde estoy"), "done")
	yield(dialog("little_chef", "Acompañeme a la mesa por favor"), "done")
	yield(dialog("viejito", "Bueno"), "done")

	get_tree().change_scene("res://scenes/viejito_pidiendo_X.tscn")
