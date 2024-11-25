extends Node2D

signal level_up

func spawn_bug():
	var new_bug = preload("res://bug.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_bug.global_position = %PathFollow2D.global_position
	add_child(new_bug)
	
func spawn_regression():
	var new_regression = preload("res://regression.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_regression.global_position = %PathFollow2D.global_position
	add_child(new_regression)
	


func _on_timer_timeout() -> void:
	spawn_bug()

func _on_regression_timer_timeout() -> void:
	spawn_regression()

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true


func _on_timer_2_timeout() -> void:
	var timer = $Timer.wait_time
	if timer > 0.5:
		$Timer.wait_time -= 0.5
		# TODO add a text more enemies are coming
	else:
		$RegressionTimer.start()
		level_up.emit()
		# TODO bring new enemies
