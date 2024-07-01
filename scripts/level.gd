extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var star_scene: PackedScene = load("res://scenes/star.tscn")


func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var number_of_stars = rng.randi_range(5,10)
	var screen_size = get_viewport().get_visible_rect().size
	for n in number_of_stars:
		var random_spot_on_screen = Vector2(rng.randi_range(0, screen_size.x), rng.randi_range(0, screen_size.y))
		var star = star_scene.instantiate()
		$Stars.add_child(star)
		star.position = random_spot_on_screen


func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	
	# Attack the node to the scene tree
	$Meteors.add_child(meteor)


func _on_player_laser(laser_position: Vector2):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = laser_position
