extends CharacterBody2D

@export var speed: int = 500
var laser_start_position: Marker2D
var laser_cooldown: Timer
var laser_can_shoot: bool = true

signal laser(position: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	laser_start_position = find_child("LaserStartPosition")
	laser_cooldown = find_child("LaserCooldown")
	
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	# This updates the position manually, which isn't really what should be used. Instead the preferred way of moving CharacterBody(s) is with velocity
	#position += direction * speed * delta

	velocity = direction * speed # Delta is added by default
	move_and_slide()

	if Input.is_action_just_pressed("attack") and laser_can_shoot:
		laser.emit(laser_start_position.global_position)

		laser_can_shoot = false
		laser_cooldown.start()

func _on_laser_cooldown_timeout():
	laser_can_shoot = true
