extends GameScene


func _cutscene():
	$backdoors/door.queue_free()


func _on_portal_player_entered():
	yield(dialog('viejito', 'Recuerdo la tierra mojada bajo mis pies. Los rayos del sol apenas sobresalían, perezosos, detrás de las nubes'), 'done')
	yield(dialog('viejito', 'Esa era nuestra rutina los domingos: durante la semana, mi abuela trabajaba incesante en su restaurante, pero los domingos…'), 'done')
	yield(dialog('viejito', 'Ahh, esos dias la cocina solo estaba abierta para nosotros'), 'done')
	yield(dialog('viejito', 'Nos despertábamos temprano a cosechar los tomates más maduros de su huerta y así empezar a cocinar, juntos, la pasta della nonna.'), 'done')
	get_tree().change_scene("res://scenes/minijuego_bloques.tscn")



func _on_closed_door_2_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')


func _on_closed_door_3_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')
