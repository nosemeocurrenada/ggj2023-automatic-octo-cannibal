extends Control
class_name Dialog

signal done

static func create(character, text) -> Dialog:
	var instance = load("res://objects/dialog.tscn").instance()
	instance.set_text(text)
	instance.set_character(character)
	return instance

func set_text(text):
	$panel/margin/hcontainer/text.text = text
	
func set_character(character):
	if character == "little_chef":
		$panel/margin/hcontainer/image.self_modulate = Color.green
	elif character == "big_chef":
		$panel/margin/hcontainer/image.self_modulate = Color.red
	elif character == "viejito":
		$panel/margin/hcontainer/image.self_modulate = Color.cyan
	else:
		$panel/margin/hcontainer/image.hide()

func is_any_action_just_pressed():
	return (
		Input.is_action_just_pressed("ui_accept") or
		Input.is_action_just_pressed("ui_right") or 
		Input.is_action_just_pressed("ui_down") or 
		Input.is_action_just_pressed("ui_up") or 
		Input.is_action_just_pressed("ui_left")
	)

func _process(delta):
	if is_any_action_just_pressed():
		get_tree().paused = false
		emit_signal("done")
		queue_free()
