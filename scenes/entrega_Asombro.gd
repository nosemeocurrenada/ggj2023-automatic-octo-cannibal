extends GameScene

var dropped_ingredient_on_pot = false

func _on_portal_to_dinning_room_player_entered():
	if not dropped_ingredient_on_pot:
		yield(dialog('big_chef', 'Los ingredientes cosechados no pueden salir de la cocina hasta que esté listo el plato'), 'done')
	else:
		get_tree().change_scene("res://scenes/viejito_plato_listo.tscn")

func _on_portal_to_backdoors_player_entered():
	yield(dialog('big_chef', 'Ya cosechaste los ingredientes necesarios'), 'done')


func _on_cooking_pot_player_entered(body):
	if body.is_in_group("player"):
		if not dropped_ingredient_on_pot:
			yield(dialog('big_chef', 'Ahora que agregaste el ingrediente, cena está lista, puedes ir a servirla'), 'done')
			dropped_ingredient_on_pot = true
		else: 
			yield(dialog('big_chef', 'La cena está lista. Puedes ir a servirla'), 'done')


func _on_big_chef_dialog():
	if not dropped_ingredient_on_pot:
		yield(dialog('big_chef', 'Agrega el ingrediente a la olla'), 'done')
	else:
		yield(dialog('big_chef', 'Ve a servirle la cena'), 'done') 
