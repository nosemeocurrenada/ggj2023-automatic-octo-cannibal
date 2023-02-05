extends GameScene

var dropped_ingredient_on_pot = false

func _on_portal_to_dinning_room_player_entered():
	if not dropped_ingredient_on_pot:
		yield(dialog('big_chef', 'Los ingredientes cosechados no pueden salir de la cocina hasta que esté listo el plato'), 'done')
	else:
		get_tree().change_scene("res://scenes/viejito_pidiendo_Asombro.tscn")

func _on_portal_to_backdoors_player_entered():
	yield(dialog('big_chef', 'Todavía necesitas descubrir los siguientes ingredientes de la receta antes de cosecharlos'), 'done')


func _on_cooking_pot_player_entered(body):
	if body.is_in_group("player"):
		if not dropped_ingredient_on_pot:
			yield(dialog('big_chef', 'Ahora que ya agregaste ese ingrediente, ve a charlar con el visitante para descubrir los próximos ingredientes'), 'done')
			dropped_ingredient_on_pot = true
		else: 
			yield(dialog('big_chef', 'Ya agregaste el ingrediente, ve a charlar con el visitante para descubrir los próximos ingredientes'), 'done')


func _on_big_chef_dialog():
	if not dropped_ingredient_on_pot:
		yield(dialog('big_chef', 'Agrega el ingrediente a la olla'), 'done')
	else:
		yield(dialog('big_chef', 'Ve a charlar con el visitante para descubrir los nuevos ingredientes de la receta'), 'done') 
