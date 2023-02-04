extends GameScene

func _cutscene():
	pass


func _on_portal_to_backdoors_player_entered():
	# TODO: Dialogo sobre que no debería ir ahi ahora
	pass


func _on_portal_to_dinning_room_player_entered():
	get_tree().change_scene("res://scenes/viejito_en_la_recepcion.tscn")
