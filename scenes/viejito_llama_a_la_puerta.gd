extends GameScene

func _cutscene():
	dialog("door", "** Sonido de llamador de ángeles **")


func _on_portal_to_backdoors_player_entered():
	dialog("little_chef", "No debería entrar en la recepción")


func _on_portal_to_dinning_room_player_entered():
	get_tree().change_scene("res://scenes/viejito_en_la_recepcion.tscn")


func _on_big_chef_dialog():
	yield(dialog("big_chef", "Llegó un nuevo viejito"), "done")
	yield(dialog("big_chef", "andá para la izquierda chango"), "done")
	yield(dialog("little_chef", "ok ok"), "done")
