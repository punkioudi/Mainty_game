extends Area2D

var speed = 400

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
		
func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	new_bullet.set_speed(speed)
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout() -> void:
	shoot()

func set_speed(speed2):
	speed = speed2

func increase_rof():
	$Timer.wait_time = 0.3
