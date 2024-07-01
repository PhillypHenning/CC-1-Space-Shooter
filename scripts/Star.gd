extends Node2D

var animated_sprite: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = find_child("AnimatedSprite2D")
	
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	
	# Randomize scale
	var random_scale = rng.randf_range(1, 5)
	scale = scale * Vector2(random_scale, random_scale)

	# Randomize speed
	var random_speed = rng.randf_range(1, 5)
	animated_sprite.speed_scale = random_speed
	animated_sprite.play()
