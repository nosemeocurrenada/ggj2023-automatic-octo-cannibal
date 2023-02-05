extends GameScene

func _ready():
	$backdoors/door.visible = false
	yield(dialog('viejito', 'El sol todavía no había salido el día que dejemos nuestro hogar'), 'done')
	yield(dialog('viejito', 'Ese domingo, cuando me desperté temprano y salí de la casa, fue de la mano de mi madre que me llevaba hasta el puerto'), 'done')
	yield(dialog('viejito', 'Mi abuela, en la puerta, se despedía, pero no lloraba'), 'done')
	yield(dialog('viejito', 'Fuerte, siempre fuerte. No podía, no quería, abandonar nuestro hogar'), 'done')

func _on_portal_to_kitchen_player_entered():
	get_tree().change_scene("res://scenes/entrega_Nostalgia.tscn")


func _on_opened_door_1_player_entered():
	yield(dialog('dialog_box', 'La Nostalgia ya está cosechada'), 'done')


func _on_closed_door_2_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')


func _on_closed_door_3_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')
