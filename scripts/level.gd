extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var star_scene: PackedScene = load("res://scenes/star.tscn")

var health: int = 3

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var number_of_stars = rng.randi_range(5,10)
	var screen_size = get_viewport().get_visible_rect().size
	for n in number_of_stars:
		var random_spot_on_screen = Vector2(rng.randi_range(0, screen_size.x), rng.randi_range(0, screen_size.y))
		var star = star_scene.instantiate()
		$Stars.add_child(star)
		star.position = random_spot_on_screen
		get_tree().call_group("UI", 'set_health', health)


func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	
	# Attach the node to the scene tree
	$Meteors.add_child(meteor)
	
	# connect the signal
	meteor.connect("collision", _on_meteor_collision)


func _on_meteor_collision() -> void:
	$Player.play_collision_sound()
	health -= 1
	get_tree().call_group("UI", 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")


func _on_player_laser(laser_position: Vector2):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = laser_position
