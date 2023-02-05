extends GameScene


func _cutscene():
	$backdoors/door.queue_free()
	$backdoors/door3.queue_free()


func _on_portal_player_entered():
	yield(dialog('viejito', 'El bullicio es una de las cosas que más recuerdo de mis épocas allí. Éramos muchos y de distintos lugares'), 'done')
	yield(dialog('viejito', 'No todos hablábamos el mismo idioma, pero nos compreendíamos'), 'done')
	yield(dialog('viejito', 'Una mirada a veces era suficiente para trasmitir la incertidumbre, pero también la esperanza'), 'done')
	yield(dialog('viejito', 'Cuando nosotros llegamos, el lugar ya nos estaba esperando, pero siempre me pregunté cómo nuestras casas llegaron a ser'), 'done')
	get_tree().change_scene("res://scenes/minijuego_bloques.tscn")


func _on_opened_door_1_player_entered():
	yield(dialog('dialog_box', 'Ya cosechaste este recuerdo'), 'done')

func _on_closed_door_2_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')
