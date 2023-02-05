extends RigidBody2D

var seconds_still = 0

func _ready():
	$sprite.frame = randi() % 4
	$sprite2.frame = $sprite.frame + 4


func is_any_action_just_released():
	return (
		Input.is_action_just_released("ui_accept") or
		Input.is_action_just_released("ui_right") or 
		Input.is_action_just_released("ui_down") or 
		Input.is_action_just_released("ui_up") or 
		Input.is_action_just_released("ui_left")
	)

func is_still():
	return seconds_still > 1

func is_moving_right():
	return self.mode == MODE_KINEMATIC

func _process(delta):
	if is_moving_right():
		if is_any_action_just_released():
			$soga.queue_free()
			self.mode = MODE_RIGID
		else:
			position.x += 40 * delta
	if linear_velocity.length_squared() < 0.01 and angular_velocity < 0.01:
		seconds_still += delta
	else:
		seconds_still = 0

func reveal_buildings():
	$tween.interpolate_property($sprite2, "self_modulate:a", 0, 1, 3)
	$tween.start()
