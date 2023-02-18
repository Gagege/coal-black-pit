extends StaticBody

func _ready():
	

func _on_Area_body_entered(body: Node):
	if body is Player and body.equipped_item == "BoltCutters":
		queue_free()
