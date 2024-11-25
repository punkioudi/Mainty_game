extends Area2D

var travelled_distance = 0
var SPEED = 400
var RANGE = 1200

func _physics_process(delta: float) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()

func set_speed(speed):
	SPEED=speed
	RANGE = 2000
	print("speed is now" + str(SPEED)) 
