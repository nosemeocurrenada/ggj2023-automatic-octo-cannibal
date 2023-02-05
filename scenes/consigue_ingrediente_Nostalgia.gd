extends GameScene

func _ready():
	$backdoors/door.visible = false

func _on_portal_to_kitchen_player_entered():
	get_tree().change_scene("res://scenes/entrega_Nostalgia.tscn")


func _on_opened_door_1_player_entered():
	yield(dialog('dialog_box', 'La Nostalgia ya está cosechada'), 'done')


func _on_closed_door_2_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')


func _on_closed_door_3_player_entered():
	yield(dialog('dialog_box', 'Este recuerdo todavía no está disponible'), 'done')
