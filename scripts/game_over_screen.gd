extends CanvasLayer

var level_scene: PackedScene = load("res://scenes/level.tscn")


func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = "{original} {score}".format({"original": $CenterContainer/VBoxContainer/Score.text, "score": Global.score})


func _input(event):
	if event.is_action_pressed("attack"):
		get_tree().change_scene_to_packed(level_scene)
