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
		$Node2D/little_chef.visible = true
		$Node2D/little_chef_left.visible = false
		$Node2D/little_chef_right.visible = false
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
		$Node2D/little_chef_left.visible = true
		$Node2D/little_chef.visible = false
		$Node2D/little_chef_right.visible = false
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
		$Node2D/little_chef_right.visible = true
		$Node2D/little_chef.visible = false
		$Node2D/little_chef_left.visible = false
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
		$Node2D/little_chef.visible = true
		$Node2D/little_chef_left.visible = false
		$Node2D/little_chef_right.visible = false

	if direction.length_squared() > 0.1:
		move_and_slide(direction.normalized() * character_velocity)
		if direction.x > 0:
			$sprite.scale.x = 1
		else:
			$sprite.scale.x = -1


func _on_dialog_area_body_entered(body: Node2D):
	if body.is_in_group("player"):
		emit_signal("dialog")
