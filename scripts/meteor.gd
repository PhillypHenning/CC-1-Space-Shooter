extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

var star_container: Node2D
var can_collide: bool = true

signal collision

func _ready() -> void:
	star_container = find_child("Stars")
	
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	
	# Start position
	var width: float = get_viewport().get_visible_rect().size[0]
	position = Vector2(rng.randf_range(0, width), rng.randf_range(-150, -50))
	
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


func _on_body_entered(_body):
	if can_collide:
		collision.emit()


func _on_area_entered(area):
	area.queue_free()
	$Explosion.play()
	can_collide = false
	$Sprite2D.hide()
	await get_tree().create_timer(1).timeout
	queue_free()
