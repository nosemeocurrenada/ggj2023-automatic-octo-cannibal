extends Control


func _on_boton_jugar_pressed():
	get_tree().change_scene("res://scenes/viejito_en_puerta.tscn")


func _on_boton_creditos_pressed():
	get_tree().change_scene("res://scenes/menu/creditos.tscn")


func _on_boton_salir_pressed():
	get_tree().quit()
