extends GameScene


func _on_portal_to_kitchen_player_entered():
	yield(dialog("big_chef", "No regreses hasta recibir al visitante"), "done")


func _on_viejito_dialog():
	yield(dialog("viejito", "Dónde estoy?"), "done")
	yield(dialog("little_chef", "..."), "done")
	yield(dialog("viejito", "No sé cómo llegué hasta acá"), "done")
	yield(dialog("little_chef", "..."), "done")
	yield(dialog("viejito", "Quién eres?"), "done")
	yield(dialog("little_chef", "!!!"), "done")
	yield(dialog("viejito", "Quieres que te siga?"), "done")
	yield(dialog("little_chef", "!!!"), "done")
	get_tree().change_scene("res://scenes/viejito_pidiendo_Nostalgia.tscn")
