extends RayCast

func _physics_process(delta):
	if is_colliding():
		GlobalEvents.emit_signal("player_looked_at", get_collider().get_node("../"))
	else:
		GlobalEvents.emit_signal("player_looked_at", null)
