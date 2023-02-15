extends GameScene

var asked_oldman = false

func _on_viejito_dialog():
	if not asked_oldman:
		yield(dialog("little_chef", "???"), "done")
		yield(dialog("viejito", "Este lugar me hace sentir en casa"), "done")
		yield(dialog("viejito", "Mi nonna tenia un restaurante similar detrás de dónde vivíamos"), "done")
		yield(dialog("little_chef", "..."), "done")
		yield(dialog("viejito", "Siempre la asocio al olor de la tierra mojada, pero ya no sé por qué. Fue hace mucho tiempo…"), "done")
		yield(dialog("viejito", "Ojalá pudiera recordar"), "done")	
		yield(dialog("little_chef", "..."), "done")
		asked_oldman = true
	else:
		yield(dialog("viejito", "Daria lo que fuera para poder recordar…"), "done")


func _on_portal_to_kitchen_player_entered():
	if not asked_oldman:
		yield(dialog("big_chef", "No olvides charlar con el visitante, siempre tienen historias interesantes que recordar"), "done")
	else:
		get_tree().change_scene("res://scenes/consulta_chef_sobre_Nostalgia.tscn")
		
