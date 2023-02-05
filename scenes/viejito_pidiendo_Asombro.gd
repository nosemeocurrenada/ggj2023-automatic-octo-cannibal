extends GameScene

var asked_oldman = false


func _on_viejito_dialog():
	if not asked_oldman:
		yield(dialog("viejito", "Qué están preparando?"), "done")
		yield(dialog("little_chef", "..."), "done")
		yield(dialog("viejito", "Ahora también huele a casa…"), "done")
		yield(dialog("little_chef", "..."), "done")
		yield(dialog("viejito", "Es extraño pensar en mi hogar. "), "done")	
		yield(dialog("viejito", "Tuve varios a lo largo de los años, pero el que más se afianzó en mi memoria fue el primero luego de nuestro arribo"), "done")	
		yield(dialog("viejito", "Los colores, la música, comunidad, la unión frente a lo desconocido…"), "done")	
		yield(dialog("viejito", "Ojalá pudiera revivir esa atmósfera una vez más"), "done")	
		asked_oldman = true
	else:
		yield(dialog("viejito", "Ojalá pudiera revivir esa atmósfera una vez más"), "done")


func _on_portal_to_kitchen_player_entered():
	if not asked_oldman:
		yield(dialog("big_chef", "Debes averiguar el siguiente ingrediente"), "done")
	else:
		get_tree().change_scene("res://scenes/consulta_chef_sobre_Asombro.tscn")
