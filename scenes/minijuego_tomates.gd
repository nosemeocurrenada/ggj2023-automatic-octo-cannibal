extends GameScene

const tomato_scene = preload("res://objects/games/tomates/tomato.tscn")
const velocity = 200
export var GOAL = 10
var rng = RandomNumberGenerator.new()
var score = 0


func _cutscene():
	$tomate.queue_free()


func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT	
	if Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
	$player.move_and_slide(direction.normalized() * velocity)
	
	
	if Input.is_action_just_pressed("ui_select"):
		_create_apple()
		
	$score.text = '%s' % (GOAL - score)
	
	if GOAL <= score:
		get_tree().change_scene("res://scenes/consigue_ingrediente_Nostalgia.tscn")
	

func _create_apple():
	var instance = tomato_scene.instance()
	rng.randomize()
	instance.position.x = rng.randi_range(30, 300)
	instance.position.y = 25
	instance.contact_monitor = true
	instance.contacts_reported = 3
	# connect(signal: String, target: Object, method: String, binds: Array = [  ], flags: int = 0)
	instance.connect("tomato_catch", self, '_on_tomate_body_entered')
	self.add_child(instance)


func _on_tomate_body_entered(body):
	body.queue_free()
	score += 1
