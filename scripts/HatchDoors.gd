extends Spatial

var _player_selected: bool = false
var is_open: bool = false

func _ready():
	var _err0 = GlobalEvents.connect("player_looked_at", self, "_on_player_looked_at")

func _on_player_looked_at(node: Node):
	if node == $HatchDoor/Door or node == $HatchDoor2/Door:
		$Selectable.highlighting = true
		_player_selected = true
	else:
		$Selectable.highlighting = false
		_player_selected = false

func _unhandled_input(event):
	if event.is_action_pressed("interact") and _player_selected:
		if is_open:
			$AnimationPlayer.play_backwards("Open")
			is_open = false
		else:
			$AnimationPlayer.play("Open")
			is_open = true
