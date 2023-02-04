extends GameScene

var pregunto_ya = false

func _on_viejito_dialog():
	yield(dialog("little_chef", "Sabe que va a querer comer?"), "done")
	yield(dialog("viejito", "La verdad que no"), "done")
	yield(dialog("little_chef", "Bueno, digame algo que le guste"), "done")
	yield(dialog("viejito", "Me gusta el arte"), "done")
	yield(dialog("little_chef", "..."), "done")
	pregunto_ya = true



func _on_portal_to_kitchen_player_entered():
	if not pregunto_ya:
		yield(dialog("little_chef", "Tengo que preguntarle al viejito que quiere comer"), "done")
	else:
		yield(dialog("big_cheff", "AAAAAAAAAAAAAAAA"), "done")
		yield(dialog("big_cheff", "La siguiente escena no está cocinada todavíá"), "done")
		
