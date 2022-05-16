extends Area

func _on_Exit_body_entered(body):
	if body.name == "Player":
		GlobalEvents.emit_signal("player_exited_level")
