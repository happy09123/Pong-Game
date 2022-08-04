extends Area2D

signal ball_out(wall_name)

export (bool) var bouncing = false

func _on_Wall_area_entered(area):
	if area is Ball:
		if bouncing:
			area.direction.y *= -1
		else:
			emit_signal("ball_out", name)
			area.queue_free()
