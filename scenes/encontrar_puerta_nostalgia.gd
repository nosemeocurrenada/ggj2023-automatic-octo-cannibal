extends GameScene


func _cutscene():
	$backdoors/door.queue_free()


func _on_portal_player_entered():
	yield(dialog('big_chef', 'ARE YOU READY FOR A JUEGAZO?'), 'done')
	yield(dialog('big_chef', '(recordar cambiarlo por el de los tomates)'), 'done')
	get_tree().change_scene("res://scenes/minijuego_bloques.tscn")

