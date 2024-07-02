extends CanvasLayer

static var image = load("res://graphics/lives/playerLife1_red.png")
var time_elapsed: int = 0

func set_health(amount):
	# remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	# create number of children of amount
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image 
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		


func _on_score_timer_timeout():
	time_elapsed += 1
	Global.score = time_elapsed
	$MarginContainer/Label.text = str(time_elapsed)
