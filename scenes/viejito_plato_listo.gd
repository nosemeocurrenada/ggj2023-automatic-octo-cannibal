extends GameScene

func _on_portal_to_kitchen_player_entered():
	yield(dialog('big_chef', 'No te olvides de servirle la cena al visitante'), 'done')


func _on_viejito_dialog():
	yield(dialog('viejito', 'Pasta! Como la que me preparaba la Nonna'), 'done')
	yield(dialog('little_chef', '!!!'), 'done')
	yield(dialog('viejito', 'Tiene sabor a infancia, a recuerdos, alegrias y tristezas'), 'done')
	yield(dialog('viejito', 'Me recuerda a la música de mis ancestros, a esperanza, victorias y derrotas'), 'done')
	yield(dialog('viejito', 'Tiene el aroma de la patria a la que anhelamos volver, pero también de la que nos vio crecer'), 'done')
	yield(dialog('viejito', 'Sabe a toda la vida que logré construir. Pero sobre todo, sabe a vivir'), 'done')
