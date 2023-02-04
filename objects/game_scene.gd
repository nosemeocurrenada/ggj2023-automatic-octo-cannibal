extends Node
class_name GameScene

var canvas_layer: CanvasLayer = null

func _ready():
	_cutscene()


func _cutscene():
	pass


func dialog(character: String, translation_key: String) -> Dialog:
	if canvas_layer == null:
		canvas_layer = CanvasLayer.new()
		canvas_layer.layer = 2
		add_child(canvas_layer)
	
	var d = Dialog.create(character, translation_key)
	canvas_layer.add_child(d)
	get_tree().paused = true
	return d
