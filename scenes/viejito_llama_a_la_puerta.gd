extends GameScene

var talked_to_big_chef = false


func _cutscene():
#	BackgroundSingleton.stop_music()
	$llamador_de_angeles.play()
	yield(dialog("door", "** Sonido de llamador de ángeles **"), "done")
	BackgroundSingleton.start_music()


func _on_portal_to_backdoors_player_entered():
	dialog("big_chef", "Todavía no necesitas entrar ahí")


func _on_portal_to_dinning_room_player_entered():
	if talked_to_big_chef == true:
		get_tree().change_scene("res://scenes/viejito_en_la_recepcion.tscn")
	else:
		yield(dialog("big_chef", "Llegó un nuevo visitante"), "done")
		yield(dialog("little_chef", "..."), "done")
		yield(dialog("big_chef", "Ve a darle la bienvenida"), "done")
		talked_to_big_chef = true


func _on_big_chef_dialog():
	if talked_to_big_chef == false:
		yield(dialog("big_chef", "Llegó un nuevo visitante"), "done")
		yield(dialog("little_chef", "..."), "done")
		yield(dialog("big_chef", "Ve a darle la bienvenida"), "done")
		talked_to_big_chef = true

	else:
		yield(dialog("big_chef", "Debes ir al comedor a darle la bienvenida al visitante"), "done")
