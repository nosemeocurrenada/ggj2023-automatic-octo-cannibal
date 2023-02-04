extends KinematicBody2D

signal dialog

export var player_controlled = false
var character_velocity = 200


func _process(delta):
	if not player_controlled:
		return
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP

	if direction.length_squared() > 0.1:
		move_and_slide(direction.normalized() * character_velocity)


func _on_dialog_area_body_entered(body: Node2D):
	if body.is_in_group("player"):
		emit_signal("dialog")
