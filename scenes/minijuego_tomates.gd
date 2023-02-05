extends GameScene

const tomato_scene = preload("res://objects/games/tomates/tomato.tscn")
const velocity = 200
export var GOAL = 10
var rng = RandomNumberGenerator.new()
var score = 0
var game_finished = false # por algun motivo no funcionaba desde _process


func _cutscene():
	$tomate.queue_free()
	BackgroundSingleton.stop_music()


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
	if Input.is_action_just_pressed("ui_accept"):
		_end_game()
	$player.move_and_slide(direction.normalized() * velocity)

	$score.text = '%s' % (GOAL - score)
	
#	if GOAL <= score:
#		_end_game()


func _create_tomato():
	var instance = tomato_scene.instance()
	rng.randomize()
	instance.position.x = rng.randi_range($spawn_min.position.x, $spawn_max.position.x)
	instance.position.y = rng.randi_range($spawn_min.position.y, $spawn_max.position.y)
	instance.contact_monitor = true
	instance.contacts_reported = 3
	instance.add_to_group('tomato')
	# connect(signal: String, target: Object, method: String, binds: Array = [  ], flags: int = 0)
	instance.connect("tomato_catch", self, '_on_tomate_body_entered')
	self.add_child(instance)


func _on_tomate_body_entered(body):
	if game_finished:
		return
	body.queue_free()
	score += 1
	rng.randomize()
	if rng.randi_range(0,1) == 0:
		$tomato_player1.play()
	else:
		$tomato_player2.play()


func _on_timer_timeout():
	if GOAL > score:
		_create_tomato()
		$timer.wait_time *= .97
	elif not game_finished:
		game_finished = true
		_end_game()


func _end_game():
	for tom in get_tree().get_nodes_in_group("tomato"):
		tom.gravity_scale = -.1
		$tween.interpolate_property(tom, 'modulate:a', 1, 0, 2)
	$tween.start()


func _on_tween_tween_all_completed():
	get_tree().change_scene("res://scenes/consigue_ingrediente_Nostalgia.tscn")	
