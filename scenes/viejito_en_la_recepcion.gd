extends GameScene


func _on_portal_to_kitchen_player_entered():
	# TODO: if ya hablo con el viejo ir a la siguiente escena
	assert(false, "Not implemented")


func _on_viejito_dialog():
	# TODO: dialogo diciendole que te acompañe
	get_tree().change_scene("res://scenes/viejito_sentado_en_la_mesa.tscn")
