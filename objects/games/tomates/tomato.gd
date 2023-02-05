extends RigidBody2D

signal tomato_catch

func _on_tomate_body_entered(body: Node2D):
	if body.is_in_group("player"):
		emit_signal("tomato_catch", self)
