extends GameScene

var talked_to_big_chef = false


func _on_big_chef_dialog():
	if not talked_to_big_chef:
		yield(dialog("little_chef", "!!!"), "done")
		yield(dialog("big_chef", "El asombro reconforta, abraza, alienta a explorar"), "done")
		yield(dialog("big_chef", "Cosechalo para que podamos seguir preparando este plato"), "done")
		yield(dialog("big_chef", "Ve al pasillo del fondo"), "done")
		yield(dialog("big_chef", "Debes abrir la puerta adecuada para cosechar el siguiente ingrediente."), "done")
		talked_to_big_chef = true
	else:
		yield(dialog("big_chef", "Busca la puerta correcta y cosecha el Asombro."), "done")
	
func _on_portal_to_backdoors_player_entered():
	if not talked_to_big_chef:
		yield(dialog("big_chef", "No quieres que te indique qué cosechar?"), "done")
	else:
		get_tree().change_scene("res://scenes/encontrar_puerta_asombro.tscn")

func _on_portal_to_dinning_room_player_entered():
	yield(dialog("big_chef", "Deberías ir a cosechar el siguiente ingrediente"), "done")
	yield(dialog("big_chef", "Ven, cuéntame qué te dijo el visitante"), "done")
