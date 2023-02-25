extends Area

func _on_Ring_body_entered(body: Node):
	if body is Player:
		body.pickup_ring()
