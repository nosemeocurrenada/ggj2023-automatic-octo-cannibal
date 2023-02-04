extends GameScene

var hablo_con_big_chef = false


func _on_big_chef_dialog():
	hablo_con_big_chef = true
	yield(dialog("big_chef", "Como que ARTE?"), "done")
	yield(dialog("big_chef", "Traele tomates pibe"), "done")
	yield(dialog("big_chef", "Toma esta llave, anda a buscarlos al fondo"), "done")


func _on_portal_to_backdoors_player_entered():
	if not hablo_con_big_chef:
		yield(dialog("little_chef", "Le tengo que preguntar sobre que ingrediente va con el arte"), "done")
	else:
		assert(false, "TODO: Not implemented")

func _on_portal_to_dinning_room_player_entered():
	yield(dialog("little_chef", "No puedo volver sin el ingrediente"), "done")
