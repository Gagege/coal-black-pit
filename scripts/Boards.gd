extends StaticBody

var player_near: bool = false

func _ready():
	var err0 = GlobalEvents.connect("player_used_item", self, "_on_player_used_item")

func _on_player_used_item(item_name: String):
	if player_near and item_name == "Crowbar":
		queue_free()

func _on_Area_body_entered(body: Node):
	if body is Player:
		player_near = true

func _on_Area_body_exited(body):
	if body is Player:
		player_near = false
