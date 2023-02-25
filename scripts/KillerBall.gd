extends RigidBody

func _on_HitBox_body_entered(body: Node):
	if body is Player:
		body.damage()
