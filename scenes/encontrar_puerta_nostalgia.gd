extends GameScene


func _cutscene():
	$backdoors/door.queue_free()


func _on_portal_player_entered():
	yield(dialog('big_chef', 'ARE YOU READY FOR A JUEGAZO?'), 'done')



func _on_closed_door_2_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')


func _on_closed_door_3_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')
