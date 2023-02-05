extends GameScene

func _ready():
	$backdoors/door.visible = false
	$backdoors/door3.visible = false
	yield(dialog('viejito', 'Lo que más anhelho son aquellas noches en las que, bajo la luz de la luna, algunos vecinos se juntaban a tocar y bailar las canciones de nuestra patria'), 'done')
	yield(dialog('viejito', 'Por algunos minutos, era como si todos siguiéramos allá, juntos, unidos, cercanos'), 'done')
	
func _on_portal_to_kitchen_player_entered():
	get_tree().change_scene("res://scenes/entrega_Asombro.tscn")


func _on_opened_door_1_player_entered():
	yield(dialog('dialog_box', 'La Nostalgia ya está cosechada'), 'done')


func _on_closed_door_2_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')


func _on_opened_door_3_player_entered():
	yield(dialog('dialog_box', 'El Asombro ya está cosechado'), 'done')

