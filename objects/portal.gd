extends Area2D

signal player_entered

func _on_portal_body_entered(body: Node2D):
	if body.is_in_group("player"):
		emit_signal("player_entered")
