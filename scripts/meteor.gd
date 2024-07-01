extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

var star_container: Node2D

func _ready() -> void:
	star_container = find_child("Stars")
	
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	
	# Start position
	var width: int = get_viewport().get_visible_rect().size[0]
	position = Vector2(rng.randi_range(0, width), rng.randi_range(-150, -50))
	
	# Sprite selection
	$Sprite2D.texture = load("res://graphics/Meteors/{}.png".format([rng.randi_range(1, 6)], "{}"))
	
	# Speed
	speed = rng.randi_range(200, 500)
	
	# Direction
	direction_x = rng.randf_range(-1, 1)
	
	# Rotation
	rotation_speed = randi_range(40, 100)
	
func _process(delta) -> void:
	position += Vector2(direction_x, 1) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body):
	print("Collided")
	print(body)
